#ifndef HELPER_H
#define HELPER_H

#include <QWidget>
#include <QPushButton>

class MainWindow : public QWidget {
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);

protected:
    void resizeEvent(QResizeEvent *event) override;

private:
    QPushButton *exitButton;
};

void showMainWindow();

#endif // HELPER_H
