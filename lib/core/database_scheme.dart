import 'package:collection/collection.dart';

abstract interface class DatabaseScheme {
  static const databaseName = 'main.db';
  static const globalConfigurations = 'pragma foreign_keys = on;';
  static final _schemes = [
    _DatabaseSchemeV1(),
    _DatabaseSchemeV2(),
    _DatabaseSchemeV3(),
    _DatabaseSchemeV4(),
  ];

  factory DatabaseScheme(int version) =>
      _schemes.firstWhere((e) => e.version == version);

  factory DatabaseScheme.migrate(int oldVersion, int newVersion) =
      _MigrateDatabaseScheme;

  factory DatabaseScheme.latest() => _LatestDatabaseScheme(_schemes);

  int get version;

  List<String> get tables;
}

class _MigrateDatabaseScheme implements DatabaseScheme {
  final int oldVersion;
  final int newVersion;

  _MigrateDatabaseScheme(this.oldVersion, this.newVersion)
      : assert(oldVersion < newVersion);

  @override
  List<String> get tables {
    final tables = <String>[];
    var currentVersion = oldVersion;
    while (currentVersion != newVersion) {
      currentVersion++;
      final scheme = DatabaseScheme(currentVersion);
      tables.addAll(scheme.tables);
    }
    return tables;
  }

  @override
  int get version => newVersion;
}

class _LatestDatabaseScheme implements DatabaseScheme {
  final List<DatabaseScheme> schemes;

  _LatestDatabaseScheme(this.schemes);

  @override
  int get version => schemes.last.version;

  @override
  List<String> get tables => schemes.map((e) => e.tables).flattened.toList();
}

class _DatabaseSchemeV1 implements DatabaseScheme {
  @override
  final version = 1;

  @override
  List<String> get tables => [
        '''
          create table Budget(
            id char(36) primary key,
            title varchar(100) not null,
            startAt varchar(50) not null,
            endAt varchar(50) not null
          );
        ''',
        '''
          create table Category(
            id char(36) primary key,
            budgetId char(36) references budget(id) on delete cascade on update cascade not null,
            title varchar(100) not null,
            iconName varchar(50) not null,
            backgroundColor varchar(50) not null,
            budgetLimit real not null 
          );
        ''',
        '''
          create table Expense(
            id char(36) primary key,
            categoryId char(36) references Category(id) on delete cascade on update cascade not null,
            title varchar(100) not null,
            value real not null,
            madeAt varchar(50) not null
          );
        ''',
      ];
}

class _DatabaseSchemeV2 implements DatabaseScheme {
  @override
  final version = 2;

  @override
  final tables = [
    '''
      alter table Expense
        add isPending bool not null default false;
    ''',
  ];
}

class _DatabaseSchemeV3 implements DatabaseScheme {
  @override
  final version = 3;

  @override
  final tables = [
    '''
      alter table Budget
        add budgetLimit real not null default 0;
    ''',
    '''
      alter table Category
        rename column budgetLimit to categoryLimit;
    ''',
  ];
}

class _DatabaseSchemeV4 implements DatabaseScheme {
  @override
  final version = 4;

  @override
  final tables = [
    '''
      alter table Budget
        add archived bool not null default false;
    ''',
  ];
}
