# Shell helpers for the mcj project.
# Secrets are pulled from macOS Keychain via claudio-secrets at call time —
# nothing sensitive lives in the shell environment between invocations.

# Snapshot the mcj prod DB before risky migrations:
#   - creates a Neon branch (fast rollback)
#   - writes a pg_dump file to ~/backups/mcj/ (off-platform copy)
#
# Usage:
#   mcj-backup pre-encryption-pr4
mcj-backup() {
  NEON_API_KEY=$(claudio-secrets get mcj neon_api_key) \
  NEON_PROJECT_ID=$(claudio-secrets get mcj neon_project_id) \
  DATABASE_URL=$(claudio-secrets get mcj neon_database_url) \
    "$HOME/workspace/projects/mcj/ops/backup-db.sh" "$@"
}
