#!/bin/bash

# スクリプトをroot権限で実行しているか確認
if [ "$EUID" -ne 0 ]; then
  echo "このスクリプトはroot権限で実行する必要があります。"
  exit 1
fi

# 現在のユーザー名を取得
CURRENT_USER=$(whoami)

# sudoersファイルに設定を追加
SUDOERS_FILE="/etc/sudoers.d/$CURRENT_USER-mount"

echo "ユーザー $CURRENT_USER に mount/umount コマンドをパスワードなしで実行する権限を追加します..."

cat <<EOF > "$SUDOERS_FILE"
# $CURRENT_USER のためのパスワードなしのmount/umount設定
$CURRENT_USER ALL=(ALL) NOPASSWD: /bin/mount, /bin/umount
EOF

# パーミッションを設定
chmod 440 "$SUDOERS_FILE"

echo "設定が完了しました。"
echo "ユーザー $CURRENT_USER は mount/umount コマンドをパスワードなしで実行できます。"

#!/bin/bash

# filepath: /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/setup_sudo.sh

# スクリプトをroot権限で実行しているか確認
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root (e.g., sudo ./setup_sudo.sh)"
  exit 1
fi

# 現在のユーザー名を取得
CURRENT_USER=$(whoami)

# sudoersファイルにエントリを追加
echo "Adding sudoers entry for user: $CURRENT_USER"
echo "$CURRENT_USER ALL=(ALL) NOPASSWD: /bin/mount, /bin/umount" > /etc/sudoers.d/$CURRENT_USER-mount

# パーミッションを設定
chmod 440 /etc/sudoers.d/$CURRENT_USER-mount

echo "Configuration complete. You can now use mount and umount without a password."
