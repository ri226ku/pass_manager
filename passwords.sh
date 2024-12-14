#!/bin/bash

PASSWORD_FILE="passwords.txt"

echo "パスワードマネージャーへようこそ！"
echo "サービス名を入力してください"
read service
echo "ユーザー名を入力してください"
read user
echo  "パスワードを入力してください"
read -s password

echo "$service:$user: $password" >> "$PASSWORD_FILE"
echo "Thank you!"
