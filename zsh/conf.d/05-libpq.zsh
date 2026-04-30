# libpq (Postgres client) is keg-only under Homebrew, so `psql`, `pg_dump`,
# etc. don't end up on PATH by default. Prepend its bin dir so they resolve
# without an absolute path.
if [ -d /opt/homebrew/opt/libpq/bin ]; then
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi
