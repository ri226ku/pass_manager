#!/bin/bash

PASSWORD_FILE="passwords.txt"

echo "パスワードマネジャーへようこそ!"

while true; do
    echo "次の選択肢から入力してください (Add Password/Get Password/Exit):"
    read option

    if [ "$option" == "Add Password" ]; then
        echo "パスワードマネージャーへようこそ！"
        echo "サービス名を入力してください:"
        read service
        echo "ユーザー名を入力してください:"
        read user
        echo "パスワードを入力してください:"
        read -s password

        echo "$service:$user:$password" >> "$PASSWORD_FILE"
        echo "パスワードの追加は成功しました。"

    elif [ "$option" == "Get Password" ]; then
        echo "サービス名を入力してください:"
        read service
        result=$(grep "^$service:" "$PASSWORD_FILE")

        if [ -z "$result" ]; then
            echo "そのサービスは登録されていません。"
        else
            echo "$result" | awk -F: '{print "サービス名: " $1 "\nユーザー名: " $2 "\nパスワード: " $3}'
        fi

    elif [ "$option" == "Exit" ]; then
        echo "Thank you!"
        exit 0

    else
        echo "入力が間違えています。Add Password/Get Password/Exit から選択してください。"
    fi
done

