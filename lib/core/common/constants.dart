const String UNKNOWN = 'UNKNOWN';

// App names
const String kAppName = 'Fullbooker';
const String kDevAppName = 'Fullbooker Dev';

/// `sqlite_master` is used to retrieve the list of all tables in an SQLite database programmatically, as an alternative to the `.tables` command in the sqlite3 command-line interface.
/// Source: [SQLite Schema Information](https://www.sqlite.org/schematab.html)
const String masterSchemaTableName = 'sqlite_master';

// DB Names
const String kDevDatabaseName = 'fullbooker.dev.store.db';
const String kProdDatabaseName = 'fullbooker.store.db';

const double kPlatformServiceFee = 5;

const List<String> kAllowedImageExtensions = <String>['jpg', 'png'];
const List<String> kAllowedVideoExtensions = <String>['mp4'];

const String kMapsAPIKey = 'AIzaSyDen5uldAkBcBPog8ajqpThWXGsiXmYSyU';
