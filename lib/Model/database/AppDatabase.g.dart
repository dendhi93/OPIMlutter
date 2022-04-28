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

  MBlockDao _blockDAOInstance;

  MDivisiDao _divisiDAOInstance;

  MAncakDao _ancakDAOInstance;

  MTphDao _tphDAOInstance;

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
            'CREATE TABLE IF NOT EXISTS `MUser` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `nik` TEXT, `firstName` TEXT, `lastName` TEXT, `roleName` TEXT, `roleCode` TEXT, `lastLoggedIn` TEXT, `registrationDate` TEXT, `popid` TEXT, `pop` TEXT, `division` TEXT, `imei` TEXT, `lastUpload` TEXT, `lastSync` TEXT, `userToken` TEXT, `companyCode` TEXT, `passwordUser` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MBlock` (`blockId` INTEGER PRIMARY KEY AUTOINCREMENT, `divisionId` TEXT, `blockName` TEXT, `divisionCode` TEXT, `companyCode` TEXT, `popCode` TEXT, `blockCode` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MDivisi` (`divisionId` INTEGER PRIMARY KEY AUTOINCREMENT, `divisionName` TEXT, `popCode` TEXT, `divisionCode` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MAncak` (`ancakId` INTEGER PRIMARY KEY AUTOINCREMENT, `blockId` TEXT, `ancakName` TEXT, `blockCode` TEXT, `popCode` TEXT, `divisionCode` TEXT, `ancakCode` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MTph` (`tphId` INTEGER PRIMARY KEY AUTOINCREMENT, `ancakId` TEXT, `tphName` TEXT, `longitude` TEXT, `latitude` TEXT, `ancakCode` TEXT, `popCode` TEXT, `divisionCode` TEXT, `tphCode` TEXT, `blockCode` TEXT, `tphIntegrityCode` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MUserDao get userDAO {
    return _userDAOInstance ??= _$MUserDao(database, changeListener);
  }

  @override
  MBlockDao get blockDAO {
    return _blockDAOInstance ??= _$MBlockDao(database, changeListener);
  }

  @override
  MDivisiDao get divisiDAO {
    return _divisiDAOInstance ??= _$MDivisiDao(database, changeListener);
  }

  @override
  MAncakDao get ancakDAO {
    return _ancakDAOInstance ??= _$MAncakDao(database, changeListener);
  }

  @override
  MTphDao get tphDAO {
    return _tphDAOInstance ??= _$MTphDao(database, changeListener);
  }
}

class _$MUserDao extends MUserDao {
  _$MUserDao(this.database, this.changeListener)
      : _mUserInsertionAdapter = InsertionAdapter(
            database,
            'MUser',
            (MUser item) => <String, Object>{
                  'id': item.id,
                  'nik': item.nik,
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
}

class _$MBlockDao extends MBlockDao {
  _$MBlockDao(this.database, this.changeListener)
      : _mBlockInsertionAdapter = InsertionAdapter(
            database,
            'MBlock',
            (MBlock item) => <String, Object>{
                  'blockId': item.blockId,
                  'divisionId': item.divisionId,
                  'blockName': item.blockName,
                  'divisionCode': item.divisionCode,
                  'companyCode': item.companyCode,
                  'popCode': item.popCode,
                  'blockCode': item.blockCode
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<MBlock> _mBlockInsertionAdapter;

  @override
  Future<void> insertBlock(MBlock block) async {
    await _mBlockInsertionAdapter.insert(block, OnConflictStrategy.abort);
  }
}

class _$MDivisiDao extends MDivisiDao {
  _$MDivisiDao(this.database, this.changeListener)
      : _mDivisiInsertionAdapter = InsertionAdapter(
            database,
            'MDivisi',
            (MDivisi item) => <String, Object>{
                  'divisionId': item.divisionId,
                  'divisionName': item.divisionName,
                  'popCode': item.popCode,
                  'divisionCode': item.divisionCode
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<MDivisi> _mDivisiInsertionAdapter;

  @override
  Future<void> insertDivisi(MDivisi division) async {
    await _mDivisiInsertionAdapter.insert(division, OnConflictStrategy.abort);
  }
}

class _$MAncakDao extends MAncakDao {
  _$MAncakDao(this.database, this.changeListener)
      : _mAncakInsertionAdapter = InsertionAdapter(
            database,
            'MAncak',
            (MAncak item) => <String, Object>{
                  'ancakId': item.ancakId,
                  'blockId': item.blockId,
                  'ancakName': item.ancakName,
                  'blockCode': item.blockCode,
                  'popCode': item.popCode,
                  'divisionCode': item.divisionCode,
                  'ancakCode': item.ancakCode
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<MAncak> _mAncakInsertionAdapter;

  @override
  Future<void> insertAncak(MAncak ancak) async {
    await _mAncakInsertionAdapter.insert(ancak, OnConflictStrategy.abort);
  }
}

class _$MTphDao extends MTphDao {
  _$MTphDao(this.database, this.changeListener)
      : _mTphInsertionAdapter = InsertionAdapter(
            database,
            'MTph',
            (MTph item) => <String, Object>{
                  'tphId': item.tphId,
                  'ancakId': item.ancakId,
                  'tphName': item.tphName,
                  'longitude': item.longitude,
                  'latitude': item.latitude,
                  'ancakCode': item.ancakCode,
                  'popCode': item.popCode,
                  'divisionCode': item.divisionCode,
                  'tphCode': item.tphCode,
                  'blockCode': item.blockCode,
                  'tphIntegrityCode': item.tphIntegrityCode
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<MTph> _mTphInsertionAdapter;

  @override
  Future<void> insertTph(MTph tph) async {
    await _mTphInsertionAdapter.insert(tph, OnConflictStrategy.abort);
  }
}
