# Let's Encrypt 証明書発行

certbot コマンドを使って、webroot 方式で証明書を発行する。

## 設定
config/{config_name}.sh に設定を書く。

### サンプル
```
# Let's Encrypt に申請する発行者のメールアドレス
email='admin@example.com'

# ドメインとドキュメント ルートの対応（JSON 形式。ドメイン名: ドキュメント ルート）
webroot_map='{"example.com":"/www/example/","shop.example.com":"/www/example-shop/"}'

# 証明書発行後に実行するコマンド
on_complete='systemctl reload httpd'

# Let's Encrypt のステージング環境でテスト用の証明書を発行（yes / no）
staging=no
```

## 実行
```
./issue.sh {config_name}
```
新規発行も更新も同じ。
秘密鍵、証明書は、config/live/{config_name}/ に保存される。
