# certbot コマンドで証明書を発行

- ACME v1 プロトコルを使う
- webroot で認証
- certonly（Web サーバーの再起動などはしない）
- フックの設定はしない

## 設定

### サンプル
```
# renew する時などに使う管理用の名前（証明書の内容には影響しない）
cert_name=cert1

# Let's Encrypt に申請する発行者のメールアドレス
email='admin@example.com'

# ドメインとドキュメント ルートの対応（JSON 形式。ドメイン名: ドキュメント ルート）
webroot_map='{"example.com":"/www/main","sub.example.com":"/www/sub"}'

# Let's Encrypt のステージング環境でテスト用の証明書を発行（yes / no）
staging=yes
```

## 実行
```
./setup.sh config_file [options..]
```
options はそのまま certbot コマンドに渡される。

基本は root 権限で実行する。
非 root 権限で実行する場合は、--config-dir --logs-dir --work-dir オプションが必要。


## 証明書の更新
```
certbot renew [options..]
```
よく使うオプション：

- --cert-name cert_name  特定の証明書だけ更新
- --force-renewal  有効期限に余裕があっても強制的に更新
- --no-directory-hooks  フックを実行しない
- --quiet  メッセージを抑制

## ステージングと本番の切り替え

レシピ ファイルの staging を変更して setup.sh を再実行。

ステージングから本番に切り替えるときは setup.sh --break-my-certs。
