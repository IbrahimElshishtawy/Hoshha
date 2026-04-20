// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_record.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetBudgetRecordCollection on Isar {
  IsarCollection<int, BudgetRecord> get budgetRecords => this.collection();
}

const BudgetRecordSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'BudgetRecord',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(name: 'entityId', type: IsarType.string),
      IsarPropertySchema(name: 'monthKey', type: IsarType.string),
      IsarPropertySchema(name: 'limitMinor', type: IsarType.long),
      IsarPropertySchema(name: 'createdAt', type: IsarType.dateTime),
      IsarPropertySchema(name: 'updatedAt', type: IsarType.dateTime),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'entityId',
        properties: ["entityId"],
        unique: true,
        hash: false,
      ),
      IsarIndexSchema(
        name: 'monthKey',
        properties: ["monthKey"],
        unique: true,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, BudgetRecord>(
    serialize: serializeBudgetRecord,
    deserialize: deserializeBudgetRecord,
    deserializeProperty: deserializeBudgetRecordProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeBudgetRecord(IsarWriter writer, BudgetRecord object) {
  IsarCore.writeString(writer, 1, object.entityId);
  IsarCore.writeString(writer, 2, object.monthKey);
  IsarCore.writeLong(writer, 3, object.limitMinor);
  IsarCore.writeLong(
    writer,
    4,
    object.createdAt.toUtc().microsecondsSinceEpoch,
  );
  IsarCore.writeLong(
    writer,
    5,
    object.updatedAt.toUtc().microsecondsSinceEpoch,
  );
  return object.id;
}

@isarProtected
BudgetRecord deserializeBudgetRecord(IsarReader reader) {
  final object = BudgetRecord();
  object.id = IsarCore.readId(reader);
  object.entityId = IsarCore.readString(reader, 1) ?? '';
  object.monthKey = IsarCore.readString(reader, 2) ?? '';
  object.limitMinor = IsarCore.readLong(reader, 3);
  {
    final value = IsarCore.readLong(reader, 4);
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
    final value = IsarCore.readLong(reader, 5);
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
dynamic deserializeBudgetRecordProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readLong(reader, 3);
    case 4:
      {
        final value = IsarCore.readLong(reader, 4);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(
            value,
            isUtc: true,
          ).toLocal();
        }
      }
    case 5:
      {
        final value = IsarCore.readLong(reader, 5);
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

sealed class _BudgetRecordUpdate {
  bool call({
    required int id,
    String? entityId,
    String? monthKey,
    int? limitMinor,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _BudgetRecordUpdateImpl implements _BudgetRecordUpdate {
  const _BudgetRecordUpdateImpl(this.collection);

  final IsarCollection<int, BudgetRecord> collection;

  @override
  bool call({
    required int id,
    Object? entityId = ignore,
    Object? monthKey = ignore,
    Object? limitMinor = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties(
          [id],
          {
            if (entityId != ignore) 1: entityId as String?,
            if (monthKey != ignore) 2: monthKey as String?,
            if (limitMinor != ignore) 3: limitMinor as int?,
            if (createdAt != ignore) 4: createdAt as DateTime?,
            if (updatedAt != ignore) 5: updatedAt as DateTime?,
          },
        ) >
        0;
  }
}

sealed class _BudgetRecordUpdateAll {
  int call({
    required List<int> id,
    String? entityId,
    String? monthKey,
    int? limitMinor,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _BudgetRecordUpdateAllImpl implements _BudgetRecordUpdateAll {
  const _BudgetRecordUpdateAllImpl(this.collection);

  final IsarCollection<int, BudgetRecord> collection;

  @override
  int call({
    required List<int> id,
    Object? entityId = ignore,
    Object? monthKey = ignore,
    Object? limitMinor = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties(id, {
      if (entityId != ignore) 1: entityId as String?,
      if (monthKey != ignore) 2: monthKey as String?,
      if (limitMinor != ignore) 3: limitMinor as int?,
      if (createdAt != ignore) 4: createdAt as DateTime?,
      if (updatedAt != ignore) 5: updatedAt as DateTime?,
    });
  }
}

extension BudgetRecordUpdate on IsarCollection<int, BudgetRecord> {
  _BudgetRecordUpdate get update => _BudgetRecordUpdateImpl(this);

  _BudgetRecordUpdateAll get updateAll => _BudgetRecordUpdateAllImpl(this);
}

sealed class _BudgetRecordQueryUpdate {
  int call({
    String? entityId,
    String? monthKey,
    int? limitMinor,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _BudgetRecordQueryUpdateImpl implements _BudgetRecordQueryUpdate {
  const _BudgetRecordQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<BudgetRecord> query;
  final int? limit;

  @override
  int call({
    Object? entityId = ignore,
    Object? monthKey = ignore,
    Object? limitMinor = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (entityId != ignore) 1: entityId as String?,
      if (monthKey != ignore) 2: monthKey as String?,
      if (limitMinor != ignore) 3: limitMinor as int?,
      if (createdAt != ignore) 4: createdAt as DateTime?,
      if (updatedAt != ignore) 5: updatedAt as DateTime?,
    });
  }
}

extension BudgetRecordQueryUpdate on IsarQuery<BudgetRecord> {
  _BudgetRecordQueryUpdate get updateFirst =>
      _BudgetRecordQueryUpdateImpl(this, limit: 1);

  _BudgetRecordQueryUpdate get updateAll => _BudgetRecordQueryUpdateImpl(this);
}

class _BudgetRecordQueryBuilderUpdateImpl implements _BudgetRecordQueryUpdate {
  const _BudgetRecordQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<BudgetRecord, BudgetRecord, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? entityId = ignore,
    Object? monthKey = ignore,
    Object? limitMinor = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (entityId != ignore) 1: entityId as String?,
        if (monthKey != ignore) 2: monthKey as String?,
        if (limitMinor != ignore) 3: limitMinor as int?,
        if (createdAt != ignore) 4: createdAt as DateTime?,
        if (updatedAt != ignore) 5: updatedAt as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension BudgetRecordQueryBuilderUpdate
    on QueryBuilder<BudgetRecord, BudgetRecord, QOperations> {
  _BudgetRecordQueryUpdate get updateFirst =>
      _BudgetRecordQueryBuilderUpdateImpl(this, limit: 1);

  _BudgetRecordQueryUpdate get updateAll =>
      _BudgetRecordQueryBuilderUpdateImpl(this);
}

extension BudgetRecordQueryFilter
    on QueryBuilder<BudgetRecord, BudgetRecord, QFilterCondition> {
  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 0, value: value));
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 0, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 1, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdGreaterThan(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdGreaterThanOrEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdLessThan(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 1, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdLessThanOrEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdBetween(String lower, String upper, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(property: 1, value: ''),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  entityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(property: 1, value: ''),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 2, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyGreaterThan(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyGreaterThanOrEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyLessThan(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 2, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyLessThanOrEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyBetween(String lower, String upper, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(property: 2, value: ''),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  monthKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(property: 2, value: ''),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  limitMinorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  limitMinorGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  limitMinorGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  limitMinorLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 3, value: value));
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  limitMinorLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  limitMinorBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 3, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  createdAtGreaterThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  createdAtLessThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 4, value: value));
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  createdAtLessThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  createdAtBetween(DateTime lower, DateTime upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 4, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  updatedAtGreaterThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  updatedAtLessThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 5, value: value));
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  updatedAtLessThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterFilterCondition>
  updatedAtBetween(DateTime lower, DateTime upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 5, lower: lower, upper: upper),
      );
    });
  }
}

extension BudgetRecordQueryObject
    on QueryBuilder<BudgetRecord, BudgetRecord, QFilterCondition> {}

extension BudgetRecordQuerySortBy
    on QueryBuilder<BudgetRecord, BudgetRecord, QSortBy> {
  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortByEntityId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortByEntityIdDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortByMonthKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortByMonthKeyDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortByLimitMinor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy>
  sortByLimitMinorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension BudgetRecordQuerySortThenBy
    on QueryBuilder<BudgetRecord, BudgetRecord, QSortThenBy> {
  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenByEntityId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenByEntityIdDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenByMonthKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenByMonthKeyDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenByLimitMinor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy>
  thenByLimitMinorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension BudgetRecordQueryWhereDistinct
    on QueryBuilder<BudgetRecord, BudgetRecord, QDistinct> {
  QueryBuilder<BudgetRecord, BudgetRecord, QAfterDistinct> distinctByEntityId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterDistinct> distinctByMonthKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterDistinct>
  distinctByLimitMinor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<BudgetRecord, BudgetRecord, QAfterDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }
}

extension BudgetRecordQueryProperty1
    on QueryBuilder<BudgetRecord, BudgetRecord, QProperty> {
  QueryBuilder<BudgetRecord, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<BudgetRecord, String, QAfterProperty> entityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BudgetRecord, String, QAfterProperty> monthKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<BudgetRecord, int, QAfterProperty> limitMinorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<BudgetRecord, DateTime, QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<BudgetRecord, DateTime, QAfterProperty> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension BudgetRecordQueryProperty2<R>
    on QueryBuilder<BudgetRecord, R, QAfterProperty> {
  QueryBuilder<BudgetRecord, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<BudgetRecord, (R, String), QAfterProperty> entityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BudgetRecord, (R, String), QAfterProperty> monthKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<BudgetRecord, (R, int), QAfterProperty> limitMinorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<BudgetRecord, (R, DateTime), QAfterProperty>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<BudgetRecord, (R, DateTime), QAfterProperty>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension BudgetRecordQueryProperty3<R1, R2>
    on QueryBuilder<BudgetRecord, (R1, R2), QAfterProperty> {
  QueryBuilder<BudgetRecord, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<BudgetRecord, (R1, R2, String), QOperations> entityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BudgetRecord, (R1, R2, String), QOperations> monthKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<BudgetRecord, (R1, R2, int), QOperations> limitMinorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<BudgetRecord, (R1, R2, DateTime), QOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<BudgetRecord, (R1, R2, DateTime), QOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}
