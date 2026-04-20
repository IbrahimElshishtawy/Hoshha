// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_record.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetUserStatsRecordCollection on Isar {
  IsarCollection<int, UserStatsRecord> get userStatsRecords =>
      this.collection();
}

const UserStatsRecordSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'UserStatsRecord',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(name: 'totalXp', type: IsarType.long),
      IsarPropertySchema(name: 'level', type: IsarType.long),
      IsarPropertySchema(name: 'totalExpensesCount', type: IsarType.long),
      IsarPropertySchema(name: 'totalSpentMinor', type: IsarType.long),
      IsarPropertySchema(name: 'lastExpenseAt', type: IsarType.dateTime),
      IsarPropertySchema(name: 'createdAt', type: IsarType.dateTime),
      IsarPropertySchema(name: 'updatedAt', type: IsarType.dateTime),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, UserStatsRecord>(
    serialize: serializeUserStatsRecord,
    deserialize: deserializeUserStatsRecord,
    deserializeProperty: deserializeUserStatsRecordProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeUserStatsRecord(IsarWriter writer, UserStatsRecord object) {
  IsarCore.writeLong(writer, 1, object.totalXp);
  IsarCore.writeLong(writer, 2, object.level);
  IsarCore.writeLong(writer, 3, object.totalExpensesCount);
  IsarCore.writeLong(writer, 4, object.totalSpentMinor);
  IsarCore.writeLong(
    writer,
    5,
    object.lastExpenseAt?.toUtc().microsecondsSinceEpoch ??
        -9223372036854775808,
  );
  IsarCore.writeLong(
    writer,
    6,
    object.createdAt.toUtc().microsecondsSinceEpoch,
  );
  IsarCore.writeLong(
    writer,
    7,
    object.updatedAt.toUtc().microsecondsSinceEpoch,
  );
  return object.id;
}

@isarProtected
UserStatsRecord deserializeUserStatsRecord(IsarReader reader) {
  final object = UserStatsRecord();
  object.id = IsarCore.readId(reader);
  object.totalXp = IsarCore.readLong(reader, 1);
  object.level = IsarCore.readLong(reader, 2);
  object.totalExpensesCount = IsarCore.readLong(reader, 3);
  object.totalSpentMinor = IsarCore.readLong(reader, 4);
  {
    final value = IsarCore.readLong(reader, 5);
    if (value == -9223372036854775808) {
      object.lastExpenseAt = null;
    } else {
      object.lastExpenseAt = DateTime.fromMicrosecondsSinceEpoch(
        value,
        isUtc: true,
      ).toLocal();
    }
  }
  {
    final value = IsarCore.readLong(reader, 6);
    if (value == -9223372036854775808) {
      object.createdAt = DateTime.fromMillisecondsSinceEpoch(
        0,
        isUtc: true,
      ).toLocal();
    } else {
      object.createdAt = DateTime.fromMicrosecondsSinceEpoch(
        value,
        isUtc: true,
      ).toLocal();
    }
  }
  {
    final value = IsarCore.readLong(reader, 7);
    if (value == -9223372036854775808) {
      object.updatedAt = DateTime.fromMillisecondsSinceEpoch(
        0,
        isUtc: true,
      ).toLocal();
    } else {
      object.updatedAt = DateTime.fromMicrosecondsSinceEpoch(
        value,
        isUtc: true,
      ).toLocal();
    }
  }
  return object;
}

@isarProtected
dynamic deserializeUserStatsRecordProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readLong(reader, 1);
    case 2:
      return IsarCore.readLong(reader, 2);
    case 3:
      return IsarCore.readLong(reader, 3);
    case 4:
      return IsarCore.readLong(reader, 4);
    case 5:
      {
        final value = IsarCore.readLong(reader, 5);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(
            value,
            isUtc: true,
          ).toLocal();
        }
      }
    case 6:
      {
        final value = IsarCore.readLong(reader, 6);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(
            value,
            isUtc: true,
          ).toLocal();
        }
      }
    case 7:
      {
        final value = IsarCore.readLong(reader, 7);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(
            value,
            isUtc: true,
          ).toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _UserStatsRecordUpdate {
  bool call({
    required int id,
    int? totalXp,
    int? level,
    int? totalExpensesCount,
    int? totalSpentMinor,
    DateTime? lastExpenseAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _UserStatsRecordUpdateImpl implements _UserStatsRecordUpdate {
  const _UserStatsRecordUpdateImpl(this.collection);

  final IsarCollection<int, UserStatsRecord> collection;

  @override
  bool call({
    required int id,
    Object? totalXp = ignore,
    Object? level = ignore,
    Object? totalExpensesCount = ignore,
    Object? totalSpentMinor = ignore,
    Object? lastExpenseAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties(
          [id],
          {
            if (totalXp != ignore) 1: totalXp as int?,
            if (level != ignore) 2: level as int?,
            if (totalExpensesCount != ignore) 3: totalExpensesCount as int?,
            if (totalSpentMinor != ignore) 4: totalSpentMinor as int?,
            if (lastExpenseAt != ignore) 5: lastExpenseAt as DateTime?,
            if (createdAt != ignore) 6: createdAt as DateTime?,
            if (updatedAt != ignore) 7: updatedAt as DateTime?,
          },
        ) >
        0;
  }
}

sealed class _UserStatsRecordUpdateAll {
  int call({
    required List<int> id,
    int? totalXp,
    int? level,
    int? totalExpensesCount,
    int? totalSpentMinor,
    DateTime? lastExpenseAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _UserStatsRecordUpdateAllImpl implements _UserStatsRecordUpdateAll {
  const _UserStatsRecordUpdateAllImpl(this.collection);

  final IsarCollection<int, UserStatsRecord> collection;

  @override
  int call({
    required List<int> id,
    Object? totalXp = ignore,
    Object? level = ignore,
    Object? totalExpensesCount = ignore,
    Object? totalSpentMinor = ignore,
    Object? lastExpenseAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties(id, {
      if (totalXp != ignore) 1: totalXp as int?,
      if (level != ignore) 2: level as int?,
      if (totalExpensesCount != ignore) 3: totalExpensesCount as int?,
      if (totalSpentMinor != ignore) 4: totalSpentMinor as int?,
      if (lastExpenseAt != ignore) 5: lastExpenseAt as DateTime?,
      if (createdAt != ignore) 6: createdAt as DateTime?,
      if (updatedAt != ignore) 7: updatedAt as DateTime?,
    });
  }
}

extension UserStatsRecordUpdate on IsarCollection<int, UserStatsRecord> {
  _UserStatsRecordUpdate get update => _UserStatsRecordUpdateImpl(this);

  _UserStatsRecordUpdateAll get updateAll =>
      _UserStatsRecordUpdateAllImpl(this);
}

sealed class _UserStatsRecordQueryUpdate {
  int call({
    int? totalXp,
    int? level,
    int? totalExpensesCount,
    int? totalSpentMinor,
    DateTime? lastExpenseAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _UserStatsRecordQueryUpdateImpl implements _UserStatsRecordQueryUpdate {
  const _UserStatsRecordQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<UserStatsRecord> query;
  final int? limit;

  @override
  int call({
    Object? totalXp = ignore,
    Object? level = ignore,
    Object? totalExpensesCount = ignore,
    Object? totalSpentMinor = ignore,
    Object? lastExpenseAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (totalXp != ignore) 1: totalXp as int?,
      if (level != ignore) 2: level as int?,
      if (totalExpensesCount != ignore) 3: totalExpensesCount as int?,
      if (totalSpentMinor != ignore) 4: totalSpentMinor as int?,
      if (lastExpenseAt != ignore) 5: lastExpenseAt as DateTime?,
      if (createdAt != ignore) 6: createdAt as DateTime?,
      if (updatedAt != ignore) 7: updatedAt as DateTime?,
    });
  }
}

extension UserStatsRecordQueryUpdate on IsarQuery<UserStatsRecord> {
  _UserStatsRecordQueryUpdate get updateFirst =>
      _UserStatsRecordQueryUpdateImpl(this, limit: 1);

  _UserStatsRecordQueryUpdate get updateAll =>
      _UserStatsRecordQueryUpdateImpl(this);
}

class _UserStatsRecordQueryBuilderUpdateImpl
    implements _UserStatsRecordQueryUpdate {
  const _UserStatsRecordQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<UserStatsRecord, UserStatsRecord, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? totalXp = ignore,
    Object? level = ignore,
    Object? totalExpensesCount = ignore,
    Object? totalSpentMinor = ignore,
    Object? lastExpenseAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (totalXp != ignore) 1: totalXp as int?,
        if (level != ignore) 2: level as int?,
        if (totalExpensesCount != ignore) 3: totalExpensesCount as int?,
        if (totalSpentMinor != ignore) 4: totalSpentMinor as int?,
        if (lastExpenseAt != ignore) 5: lastExpenseAt as DateTime?,
        if (createdAt != ignore) 6: createdAt as DateTime?,
        if (updatedAt != ignore) 7: updatedAt as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension UserStatsRecordQueryBuilderUpdate
    on QueryBuilder<UserStatsRecord, UserStatsRecord, QOperations> {
  _UserStatsRecordQueryUpdate get updateFirst =>
      _UserStatsRecordQueryBuilderUpdateImpl(this, limit: 1);

  _UserStatsRecordQueryUpdate get updateAll =>
      _UserStatsRecordQueryBuilderUpdateImpl(this);
}

extension UserStatsRecordQueryFilter
    on QueryBuilder<UserStatsRecord, UserStatsRecord, QFilterCondition> {
  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  idGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  idLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 0, value: value));
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  idBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 0, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalXpEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalXpGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalXpGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalXpLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 1, value: value));
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalXpLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalXpBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 1, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  levelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 2, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  levelGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 2, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  levelGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 2, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  levelLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 2, value: value));
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  levelLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 2, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  levelBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 2, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalExpensesCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalExpensesCountGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalExpensesCountGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalExpensesCountLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 3, value: value));
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalExpensesCountLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalExpensesCountBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 3, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalSpentMinorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalSpentMinorGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalSpentMinorGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalSpentMinorLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 4, value: value));
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalSpentMinorLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  totalSpentMinorBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 4, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  lastExpenseAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  lastExpenseAtIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  lastExpenseAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  lastExpenseAtGreaterThan(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  lastExpenseAtGreaterThanOrEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  lastExpenseAtLessThan(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 5, value: value));
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  lastExpenseAtLessThanOrEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  lastExpenseAtBetween(DateTime? lower, DateTime? upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 5, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 6, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 6, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  createdAtGreaterThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 6, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  createdAtLessThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 6, value: value));
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  createdAtLessThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 6, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  createdAtBetween(DateTime lower, DateTime upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 6, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 7, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 7, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  updatedAtGreaterThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 7, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  updatedAtLessThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 7, value: value));
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  updatedAtLessThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 7, value: value),
      );
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterFilterCondition>
  updatedAtBetween(DateTime lower, DateTime upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 7, lower: lower, upper: upper),
      );
    });
  }
}

extension UserStatsRecordQueryObject
    on QueryBuilder<UserStatsRecord, UserStatsRecord, QFilterCondition> {}

extension UserStatsRecordQuerySortBy
    on QueryBuilder<UserStatsRecord, UserStatsRecord, QSortBy> {
  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy> sortByTotalXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByTotalXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByTotalExpensesCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByTotalExpensesCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByTotalSpentMinor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByTotalSpentMinorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByLastExpenseAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByLastExpenseAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }
}

extension UserStatsRecordQuerySortThenBy
    on QueryBuilder<UserStatsRecord, UserStatsRecord, QSortThenBy> {
  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy> thenByTotalXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByTotalXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByTotalExpensesCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByTotalExpensesCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByTotalSpentMinor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByTotalSpentMinorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByLastExpenseAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByLastExpenseAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }
}

extension UserStatsRecordQueryWhereDistinct
    on QueryBuilder<UserStatsRecord, UserStatsRecord, QDistinct> {
  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterDistinct>
  distinctByTotalXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterDistinct>
  distinctByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterDistinct>
  distinctByTotalExpensesCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterDistinct>
  distinctByTotalSpentMinor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterDistinct>
  distinctByLastExpenseAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }

  QueryBuilder<UserStatsRecord, UserStatsRecord, QAfterDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7);
    });
  }
}

extension UserStatsRecordQueryProperty1
    on QueryBuilder<UserStatsRecord, UserStatsRecord, QProperty> {
  QueryBuilder<UserStatsRecord, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserStatsRecord, int, QAfterProperty> totalXpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserStatsRecord, int, QAfterProperty> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserStatsRecord, int, QAfterProperty>
  totalExpensesCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<UserStatsRecord, int, QAfterProperty> totalSpentMinorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<UserStatsRecord, DateTime?, QAfterProperty>
  lastExpenseAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<UserStatsRecord, DateTime, QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<UserStatsRecord, DateTime, QAfterProperty> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension UserStatsRecordQueryProperty2<R>
    on QueryBuilder<UserStatsRecord, R, QAfterProperty> {
  QueryBuilder<UserStatsRecord, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserStatsRecord, (R, int), QAfterProperty> totalXpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserStatsRecord, (R, int), QAfterProperty> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserStatsRecord, (R, int), QAfterProperty>
  totalExpensesCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<UserStatsRecord, (R, int), QAfterProperty>
  totalSpentMinorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<UserStatsRecord, (R, DateTime?), QAfterProperty>
  lastExpenseAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<UserStatsRecord, (R, DateTime), QAfterProperty>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<UserStatsRecord, (R, DateTime), QAfterProperty>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension UserStatsRecordQueryProperty3<R1, R2>
    on QueryBuilder<UserStatsRecord, (R1, R2), QAfterProperty> {
  QueryBuilder<UserStatsRecord, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserStatsRecord, (R1, R2, int), QOperations> totalXpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserStatsRecord, (R1, R2, int), QOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserStatsRecord, (R1, R2, int), QOperations>
  totalExpensesCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<UserStatsRecord, (R1, R2, int), QOperations>
  totalSpentMinorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<UserStatsRecord, (R1, R2, DateTime?), QOperations>
  lastExpenseAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<UserStatsRecord, (R1, R2, DateTime), QOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<UserStatsRecord, (R1, R2, DateTime), QOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}
