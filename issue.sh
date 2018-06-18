cd $(dirname "$0")

error() {
  echo "$2" >&2
  exit $1
}

if [ "$1" = "" ]; then
  error 1 "Usage: $0 CONFIG_NAME"
fi

config="config/$1.sh"
if [ ! -f "$config" ]; then
  error 1 "Configuration file $config not found."
fi

if ! source "$config"; then
  error 1 "Could not load $config"
fi

if [ "$staging" = "yes" ]; then
  staging="--staging"
else
  staging=""
fi

certbot certonly \
  --webroot \
  --agree-tos \
  --quiet \
  --non-interactive \
  --config-dir config \
  --logs-dir logs \
  --work-dir work \
  --cert-name "$cert_name" \
  --email "$email" \
  --force-renewal \
  --webroot-map "$webroot_map" \
  $staging

if [ $? -ne 0 ]; then
  error 2 "Failed."
fi

$on_complete
