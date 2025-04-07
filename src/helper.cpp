#include "helper.h"
#include <QApplication>
#include <QGridLayout>
#include <QHBoxLayout>
#include <QVBoxLayout>
#include <QLabel>
#include <QComboBox>
#include <QPushButton>
#include <QProcess>
#include <QTextEdit>
#include <QSplitter>
#include <QDebug>
#include <QRegularExpression>
#include <QDir> // 修正: ディレクトリ操作のために追加

void showMainWindow() {
    // アプリケーションのウィンドウを作成
    QWidget window;
    window.setWindowTitle("dLOGIC_ULS");

    // ウィンドウを全画面表示に設定
    window.showFullScreen();

    // メインレイアウトを作成
    QVBoxLayout *mainLayout = new QVBoxLayout(&window);

    // 上部の操作部分（画面の1/4）
    QWidget *controlArea = new QWidget(&window);
    QHBoxLayout *controlLayout = new QHBoxLayout(controlArea);

    // 「選択したSSDの名前」ラベル
    QLabel *selectedSSDLabel = new QLabel("Selected SSD: None", controlArea);
    selectedSSDLabel->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    QFont labelFont = selectedSSDLabel->font();
    labelFont.setPointSize(30); // フォントサイズを30に設定
    selectedSSDLabel->setFont(labelFont);
    selectedSSDLabel->setMinimumHeight(40); // 高さを40pxに設定
    controlLayout->addWidget(selectedSSDLabel);

    // セレクトボックス（Pythonスクリプトの選択用）
    QComboBox *scriptSelector = new QComboBox(controlArea);
    scriptSelector->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    QFont comboFont = scriptSelector->font();
    comboFont.setPointSize(30); // フォントサイズを30に設定
    scriptSelector->setFont(comboFont);
    scriptSelector->setMinimumHeight(40); // 高さを40pxに設定
    controlLayout->addWidget(scriptSelector);

    // exec_pythonディレクトリ内のPythonファイルを読み取る
    QDir scriptDir(QDir::currentPath() + "/exec_python");
    QStringList pythonFiles = scriptDir.entryList({"*.py"}, QDir::Files); // .pyファイルのみ取得
    if (!pythonFiles.isEmpty()) {
        scriptSelector->addItems(pythonFiles);
    } else {
        scriptSelector->addItem("No scripts found");
    }

    // 実行ボタン
    QPushButton *executeButton = new QPushButton("Execute", controlArea);
    executeButton->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    QFont buttonFont = executeButton->font();
    buttonFont.setPointSize(30); // フォントサイズを30に設定
    executeButton->setFont(buttonFont);
    executeButton->setMinimumHeight(40); // 高さを40pxに設定
    controlLayout->addWidget(executeButton);

    // Exitボタン
    QPushButton *exitButton = new QPushButton("Exit", controlArea);
    exitButton->setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
    QFont exitFont = exitButton->font();
    exitFont.setPointSize(20); // フォントサイズを20に設定
    exitButton->setFont(exitFont);
    exitButton->setMinimumHeight(40); // 高さを40pxに設定
    QObject::connect(exitButton, &QPushButton::clicked, &QApplication::quit);
    controlLayout->addWidget(exitButton);

    // 上部の操作部分をメインレイアウトに追加
    mainLayout->addWidget(controlArea);

    // 下部のテキストウィンドウ（左右に分割）
    QSplitter *outputSplitter = new QSplitter(Qt::Horizontal, &window);

    // 左側のテキストウィンドウ（これまでの出力）
    QTextEdit *leftOutputWindow = new QTextEdit(outputSplitter);
    leftOutputWindow->setReadOnly(true); // 読み取り専用に設定
    leftOutputWindow->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    leftOutputWindow->setPlaceholderText("Left Output: Previous logs will appear here.");

    // 右側のテキストウィンドウ（Pythonスクリプトの実行に関する出力）
    QTextEdit *rightOutputWindow = new QTextEdit(outputSplitter);
    rightOutputWindow->setReadOnly(true); // 読み取り専用に設定
    rightOutputWindow->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    rightOutputWindow->setPlaceholderText("Right Output: Python execution logs will appear here.");

    // スプリッターをメインレイアウトに追加
    outputSplitter->setStretchFactor(0, 1); // 左側のウィンドウを優先的に拡大
    outputSplitter->setStretchFactor(1, 1); // 右側のウィンドウも同じ比率で拡大
    mainLayout->addWidget(outputSplitter); // テキストボックスを追加

    // 実行ボタンのクリックイベント
    QObject::connect(executeButton, &QPushButton::clicked, [selectedSSDLabel, scriptSelector, leftOutputWindow, rightOutputWindow]() {
        QString selectedSSD = selectedSSDLabel->text().replace("Selected SSD: ", "");
        QString selectedScript = scriptSelector->currentText();
        QString mountPoint = "null"; // デフォルトでnullを設定

        if (selectedSSD == "None") {
            // SSDが選択されていない場合のエラーメッセージ
            leftOutputWindow->append("<span style='color: red; font-weight: bold;'>No SSD selected. Please select an SSD first.</span>");
        } else if (selectedScript == "No scripts found") {
            // スクリプトが見つからない場合のエラーメッセージ
            leftOutputWindow->append("<span style='color: red; font-weight: bold;'>No script available to execute.</span>");
        } else {
            // マウント状況を確認
            QProcess process;
            process.start("mount", QStringList());
            process.waitForFinished();
            QString output = process.readAllStandardOutput();

            if (output.contains(selectedSSD)) {
                // マウントポイントを取得
                QRegularExpression regex(QString("%1 on (\\S+)").arg(selectedSSD));
                QRegularExpressionMatch match = regex.match(output);
                if (match.hasMatch()) {
                    mountPoint = match.captured(1); // マウントポイントを取得
                }
            }

            // 実行するPythonスクリプトと引数をテキストボックスに表示
            QString message = QString("Executing Python script: %1\nArguments: %2").arg(selectedScript, mountPoint);
            rightOutputWindow->append(message);

            // 実際のスクリプト実行
            QProcess *scriptProcess = new QProcess(rightOutputWindow); // 親を設定してメモリ管理
            scriptProcess->setProgram("python3");
            scriptProcess->setArguments({QDir::currentPath() + "/exec_python/" + selectedScript, mountPoint});
            scriptProcess->setProcessChannelMode(QProcess::MergedChannels);

            // 標準出力をリアルタイムで右側のテキストボックスに表示
            QObject::connect(scriptProcess, &QProcess::readyReadStandardOutput, [scriptProcess, rightOutputWindow]() {
                QString scriptOutput = scriptProcess->readAllStandardOutput();
                rightOutputWindow->append(scriptOutput);
            });

            // エラー出力をリアルタイムで右側のテキストボックスに表示
            QObject::connect(scriptProcess, &QProcess::readyReadStandardError, [scriptProcess, rightOutputWindow]() {
                QString errorOutput = scriptProcess->readAllStandardError();
                rightOutputWindow->append("<span style='color: red; font-weight: bold;'>" + errorOutput + "</span>");
            });

            // スクリプトの実行開始
            scriptProcess->start();
            if (!scriptProcess->waitForStarted()) {
                rightOutputWindow->append("<span style='color: red; font-weight: bold;'>Failed to start the script.</span>");
            }

            // スクリプトの終了時にメッセージを表示
            QObject::connect(scriptProcess, QOverload<int, QProcess::ExitStatus>::of(&QProcess::finished),
                             [scriptProcess, leftOutputWindow, rightOutputWindow](int exitCode, QProcess::ExitStatus exitStatus) {
                                 if (exitStatus == QProcess::NormalExit) {
                                     rightOutputWindow->append("<span style='color: green; font-weight: bold;'>Script finished with exit code: " + QString::number(exitCode) + "</span>");
                                 } else {
                                     rightOutputWindow->append("<span style='color: red; font-weight: bold;'>Script crashed.</span>");
                                 }

                                 // 実行結果を左側に移動（Pythonに関する出力は移動しない）
                                 leftOutputWindow->append("Python script execution completed.");

                                 scriptProcess->deleteLater(); // プロセスを削除
                             });
        }
    });

    // 上部のSSDセル部分（画面の4/5）
    QWidget *ssdArea = new QWidget(&window);
    QGridLayout *gridLayout = new QGridLayout(ssdArea);
    ssdArea->setFixedHeight(window.height() * 4 / 5); // 高さを画面の4/5に設定
    mainLayout->addWidget(ssdArea);

    // SSDデバイス名のリスト
    QStringList ssdDevices = {"/dev/nvme1n1p1", "/dev/nvme3n1p1", "/dev/nvme5n1p1", "/dev/nvme7n1p1",
                              "/dev/nvme9n1p1", "/dev/nvme0n1p1", "/dev/nvme2n1p1", "/dev/nvme4n1p1",
                              "/dev/nvme6n1p1", "/dev/nvme8n1p1"};

    // 5列2行のセルを作成
    for (int row = 0; row < 2; ++row) {
        for (int col = 0; col < 5; ++col) {
            int cellIndex = row * 5 + col; // セルのインデックス
            QString deviceName = ssdDevices[cellIndex]; // 対応するSSDデバイス名

            // セル全体を管理するウィジェット
            QWidget *cellWidget = new QWidget(ssdArea);
            QHBoxLayout *cellLayout = new QHBoxLayout(cellWidget);
            cellWidget->setStyleSheet("border: 1px solid black;"); // 黒い枠線を設定

            // 左側にSSDの接続状況を表示
            QLabel *statusLabel = new QLabel(cellWidget);
            statusLabel->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
            statusLabel->setAlignment(Qt::AlignLeft | Qt::AlignTop); // 左上揃えに設定

            // マウント状況を取得
            QProcess process;
            process.start("mount", QStringList());
            process.waitForFinished();
            QString output = process.readAllStandardOutput();
            QString mountInfo;
            bool isMounted = false;

            if (output.contains(deviceName)) {
                QRegularExpression regex(QString("%1 on (\\S+)").arg(deviceName));
                QRegularExpressionMatch match = regex.match(output);
                if (match.hasMatch()) {
                    QString mountPoint = match.captured(1);
                    mountInfo = QString("Device: %1\nStatus: Mounted\nMount Point: %2").arg(deviceName, mountPoint);
                    statusLabel->setStyleSheet("font-weight: bold; color: green;"); // 太い緑色文字
                    isMounted = true; // マウントされている
                }
            } else {
                mountInfo = QString("Device: %1\nStatus: Not Mounted").arg(deviceName);
                statusLabel->setStyleSheet("font-weight: bold; color: red;"); // 太い赤色文字
            }

            statusLabel->setText(mountInfo);

            // 右側のボタンを上下に分割
            QWidget *rightWidget = new QWidget(cellWidget);
            QVBoxLayout *rightLayout = new QVBoxLayout(rightWidget);

            // 「選択」ボタン
            QPushButton *selectButton = new QPushButton("Select", rightWidget);
            selectButton->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);

            // マウントされていない場合はボタンを非アクティブにし、文字色を灰色に設定
            if (!isMounted) {
                selectButton->setEnabled(false);
                selectButton->setStyleSheet("color: gray;");
            }

            // 「選択」ボタンのクリックイベントを設定
            QObject::connect(selectButton, &QPushButton::clicked, [deviceName, selectedSSDLabel, leftOutputWindow]() {
                // 選択したSSDの名前を更新（改行を追加）
                selectedSSDLabel->setText(QString("Selected SSD:\n%1").arg(deviceName));
                leftOutputWindow->append("<span style='color: blue; font-weight: bold;'>Selected device: " + deviceName + "</span>");
            });

            // 「マウント/アンマウント」ボタン
            QPushButton *mountButton = new QPushButton("Mount/Unmount", rightWidget);
            mountButton->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);

            // ボタンのクリックイベントを設定
            QObject::connect(mountButton, &QPushButton::clicked, [deviceName, statusLabel, selectButton, leftOutputWindow]() {
                QString mountDir = QString("/mnt/%1").arg(deviceName.split('/').last()); // /mnt/にSSD名のディレクトリを作成

                // ディレクトリが存在しない場合は作成
                QDir dir;
                if (!dir.exists(mountDir)) {
                    if (!dir.mkpath(mountDir)) {
                        // 左側のテキストボックスにエラーメッセージを出力
                        leftOutputWindow->append("<span style='color: red; font-weight: bold;'>Failed to create mount directory: " + mountDir + "</span>");
                        return;
                    }
                }

                // マウント状況を確認
                QProcess process;
                process.start("mount", QStringList());
                process.waitForFinished();
                QString output = process.readAllStandardOutput();

                if (!output.contains(deviceName)) {
                    // マウントされていない場合はマウントを実行
                    int result = QProcess::execute("sudo", {"mount", deviceName, mountDir});
                    if (result == 0) {
                        leftOutputWindow->append("<span style='color: green; font-weight: bold;'>Mounted " + deviceName + " to " + mountDir + "</span>");
                        leftOutputWindow->append("</span>"); // スタイルを閉じる
                        statusLabel->setText(QString("Device: %1\nStatus: Mounted\nMount Point: %2").arg(deviceName, mountDir));
                        statusLabel->setStyleSheet("font-weight: bold; color: green;");

                        // Selectボタンをアクティブにする
                        selectButton->setEnabled(true);
                        selectButton->setStyleSheet("");
                    } else {
                        leftOutputWindow->append("<span style='color: red; font-weight: bold;'>Failed to mount " + deviceName + "</span>");
                        leftOutputWindow->append("</span>"); // スタイルを閉じる
                    }
                } else {
                    // マウントされている場合はアンマウントを実行
                    int result = QProcess::execute("sudo", {"umount", deviceName});
                    if (result == 0) {
                        leftOutputWindow->append("<span style='color: green; font-weight: bold;'>Unmounted " + deviceName + "</span>");
                        leftOutputWindow->append("</span>"); // スタイルを閉じる
                        statusLabel->setText(QString("Device: %1\nStatus: Not Mounted").arg(deviceName));
                        statusLabel->setStyleSheet("font-weight: bold; color: red;");

                        // Selectボタンを非アクティブにする
                        selectButton->setEnabled(false);
                        selectButton->setStyleSheet("color: gray;");
                    } else {
                        leftOutputWindow->append("<span style='color: red; font-weight: bold;'>Failed to unmount " + deviceName + "</span>");
                        leftOutputWindow->append("</span>"); // スタイルを閉じる
                    }
                }
            });

            rightLayout->addWidget(selectButton);
            rightLayout->addWidget(mountButton);

            cellLayout->addWidget(statusLabel);
            cellLayout->addWidget(rightWidget);

            gridLayout->addWidget(cellWidget, row, col);
        }
    }

    mainLayout->addWidget(ssdArea);

    window.setLayout(mainLayout);
    window.show();

    QApplication::exec();
}