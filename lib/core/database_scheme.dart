abstract interface class DatabaseScheme {
  static const databaseName = 'main.db';
  static const globalConfigurations = 'pragma foreign_keys = on;';

  factory DatabaseScheme(int version) => switch (version) {
        1 => _DatabaseSchemeV1(),
        _ => throw UnsupportedError(
            'database version $version is not supported.',
          ),
      };

  List<String> get tables;
}

class _DatabaseSchemeV1 implements DatabaseScheme {
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
