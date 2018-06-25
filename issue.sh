if [ "$1" == "" ]; then
  echo "Usage: $0 config_file [options..]"
  exit 1;
fi
source "$1" 2>/dev/null || {
  echo "Could not read config file '$1'.";
  exit 1;
}
shift

if [ $staging = yes ]; then
  server=https://acme-staging.api.letsencrypt.org/directory
else
  server=https://acme-v01.api.letsencrypt.org/directory
fi

certbot certonly \
  --webroot \
  --agree-tos \
  --non-interactive \
  --cert-name "$cert_name" \
  --email "$email" \
  --webroot-map "$webroot_map" \
  --server "$server" \
  "$@"
