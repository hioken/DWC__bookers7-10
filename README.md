## 以下の設定をお願いします
- .envにファイルの作成
- FROM_MAIL = 送信元のメールアドレス
- FROM_MAIL_PASS = メールアプリのパスワード

## いつもの
```
bundle install && rails db:migrate
````

## crontabとログの設定
```
touch log/cron_log.log && bundle exec wheneverize . && bundle exec whenever --update-crontab
```