get generate locales assets/locales
dart run drift_dev schema steps lib/app/data/db/drift_migrations/ lib/app/data/db/schema_versions.dart
dart run drift_dev schema dump lib/app/data/db/database.dart lib/app/data/db/drift_migrations/