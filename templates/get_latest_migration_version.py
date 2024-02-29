import os
import json
def get_latest_migration_version(path):
    if not os.path.isdir(path):
        return "Invalid path"

    all_dirs = next(os.walk(path))[1]
    if not all_dirs:
        return "No versions found"

    version_dirs = sorted(all_dirs, key=lambda s: [int(u) for u in s.split('.')])
    return version_dirs[-1]
migration_path = os.getenv('MIGRATION_PATH', 'data_volumes/microservice_catalog/migrator/migrations/database/builder/')
latest_version = get_latest_migration_version(migration_path)
print(json.dumps({"latest_version": latest_version}))
