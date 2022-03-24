// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MUserDao _userDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MUser` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `firstName` TEXT, `lastName` TEXT, `roleName` TEXT, `roleCode` TEXT, `lastLoggedIn` TEXT, `registrationDate` TEXT, `popid` TEXT, `pop` TEXT, `division` TEXT, `imei` TEXT, `lastUpload` TEXT, `lastSync` TEXT, `isLoggedIn` INTEGER, `userToken` TEXT, `companyCode` TEXT, `passwordUser` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MUserDao get userDAO {
    return _userDAOInstance ??= _$MUserDao(database, changeListener);
  }
}

class _$MUserDao extends MUserDao {
  _$MUserDao(this.database, this.changeListener)
      : _mUserInsertionAdapter = InsertionAdapter(
            database,
            'MUser',
            (MUser item) => <String, Object>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'roleName': item.roleName,
                  'roleCode': item.roleCode,
                  'lastLoggedIn': item.lastLoggedIn,
                  'registrationDate': item.registrationDate,
                  'popid': item.popid,
                  'pop': item.pop,
                  'division': item.division,
                  'imei': item.imei,
                  'lastUpload': item.lastUpload,
                  'lastSync': item.lastSync,
                  'isLoggedIn': item.isLoggedIn == null
                      ? null
                      : (item.isLoggedIn ? 1 : 0),
                  'userToken': item.userToken,
                  'companyCode': item.companyCode,
                  'passwordUser': item.passwordUser
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<MUser> _mUserInsertionAdapter;

  @override
  Future<void> insertUser(MUser user) async {
    await _mUserInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Stream<List<MUser>> fetchStreamDataUser() {
    throw UnimplementedError();
  }

  @override
  Future<List<MUser>> findAllUser() {
    // TODO: implement findAllUser
    throw UnimplementedError();
  }
}
