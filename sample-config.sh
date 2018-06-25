# renew する時などに使う管理用の名前（証明書の内容には影響しない）
cert_name=cert1

# Let's Encrypt に申請する発行者のメールアドレス
email='admin@example.com'

# ドメインとドキュメント ルートの対応（JSON 形式。ドメイン名: ドキュメント ルート）
webroot_map='{"example.com":"/www/main","sub.example.com":"/www/sub"}'

# Let's Encrypt のステージング環境でテスト用の証明書を発行（yes / no）
staging=yes
