// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_record.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetStreakRecordCollection on Isar {
  IsarCollection<int, StreakRecord> get streakRecords => this.collection();
}

const StreakRecordSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'StreakRecord',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(name: 'type', type: IsarType.string),
      IsarPropertySchema(name: 'currentCount', type: IsarType.long),
      IsarPropertySchema(name: 'bestCount', type: IsarType.long),
      IsarPropertySchema(name: 'lastQualifiedAt', type: IsarType.dateTime),
      IsarPropertySchema(name: 'createdAt', type: IsarType.dateTime),
      IsarPropertySchema(name: 'updatedAt', type: IsarType.dateTime),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'type',
        properties: ["type"],
        unique: true,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, StreakRecord>(
    serialize: serializeStreakRecord,
    deserialize: deserializeStreakRecord,
    deserializeProperty: deserializeStreakRecordProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeStreakRecord(IsarWriter writer, StreakRecord object) {
  IsarCore.writeString(writer, 1, object.type);
  IsarCore.writeLong(writer, 2, object.currentCount);
  IsarCore.writeLong(writer, 3, object.bestCount);
  IsarCore.writeLong(
    writer,
    4,
    object.lastQualifiedAt?.toUtc().microsecondsSinceEpoch ??
        -9223372036854775808,
  );
  IsarCore.writeLong(
    writer,
    5,
    object.createdAt.toUtc().microsecondsSinceEpoch,
  );
  IsarCore.writeLong(
    writer,
    6,
    object.updatedAt.toUtc().microsecondsSinceEpoch,
  );
  return object.id;
}

@isarProtected
StreakRecord deserializeStreakRecord(IsarReader reader) {
  final object = StreakRecord();
  object.id = IsarCore.readId(reader);
  object.type = IsarCore.readString(reader, 1) ?? '';
  object.currentCount = IsarCore.readLong(reader, 2);
  object.bestCount = IsarCore.readLong(reader, 3);
  {
    final value = IsarCore.readLong(reader, 4);
    if (value == -9223372036854775808) {
      object.lastQualifiedAt = null;
    } else {
      object.lastQualifiedAt = DateTime.fromMicrosecondsSinceEpoch(
        value,
        isUtc: true,
      ).toLocal();
    }
  }
  {
    final value = IsarCore.readLong(reader, 5);
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
    final value = IsarCore.readLong(reader, 6);
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
dynamic deserializeStreakRecordProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readLong(reader, 2);
    case 3:
      return IsarCore.readLong(reader, 3);
    case 4:
      {
        final value = IsarCore.readLong(reader, 4);
        if (value == -9223372036854775808) {
          return null;
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
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _StreakRecordUpdate {
  bool call({
    required int id,
    String? type,
    int? currentCount,
    int? bestCount,
    DateTime? lastQualifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _StreakRecordUpdateImpl implements _StreakRecordUpdate {
  const _StreakRecordUpdateImpl(this.collection);

  final IsarCollection<int, StreakRecord> collection;

  @override
  bool call({
    required int id,
    Object? type = ignore,
    Object? currentCount = ignore,
    Object? bestCount = ignore,
    Object? lastQualifiedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties(
          [id],
          {
            if (type != ignore) 1: type as String?,
            if (currentCount != ignore) 2: currentCount as int?,
            if (bestCount != ignore) 3: bestCount as int?,
            if (lastQualifiedAt != ignore) 4: lastQualifiedAt as DateTime?,
            if (createdAt != ignore) 5: createdAt as DateTime?,
            if (updatedAt != ignore) 6: updatedAt as DateTime?,
          },
        ) >
        0;
  }
}

sealed class _StreakRecordUpdateAll {
  int call({
    required List<int> id,
    String? type,
    int? currentCount,
    int? bestCount,
    DateTime? lastQualifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _StreakRecordUpdateAllImpl implements _StreakRecordUpdateAll {
  const _StreakRecordUpdateAllImpl(this.collection);

  final IsarCollection<int, StreakRecord> collection;

  @override
  int call({
    required List<int> id,
    Object? type = ignore,
    Object? currentCount = ignore,
    Object? bestCount = ignore,
    Object? lastQualifiedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties(id, {
      if (type != ignore) 1: type as String?,
      if (currentCount != ignore) 2: currentCount as int?,
      if (bestCount != ignore) 3: bestCount as int?,
      if (lastQualifiedAt != ignore) 4: lastQualifiedAt as DateTime?,
      if (createdAt != ignore) 5: createdAt as DateTime?,
      if (updatedAt != ignore) 6: updatedAt as DateTime?,
    });
  }
}

extension StreakRecordUpdate on IsarCollection<int, StreakRecord> {
  _StreakRecordUpdate get update => _StreakRecordUpdateImpl(this);

  _StreakRecordUpdateAll get updateAll => _StreakRecordUpdateAllImpl(this);
}

sealed class _StreakRecordQueryUpdate {
  int call({
    String? type,
    int? currentCount,
    int? bestCount,
    DateTime? lastQualifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _StreakRecordQueryUpdateImpl implements _StreakRecordQueryUpdate {
  const _StreakRecordQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<StreakRecord> query;
  final int? limit;

  @override
  int call({
    Object? type = ignore,
    Object? currentCount = ignore,
    Object? bestCount = ignore,
    Object? lastQualifiedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (type != ignore) 1: type as String?,
      if (currentCount != ignore) 2: currentCount as int?,
      if (bestCount != ignore) 3: bestCount as int?,
      if (lastQualifiedAt != ignore) 4: lastQualifiedAt as DateTime?,
      if (createdAt != ignore) 5: createdAt as DateTime?,
      if (updatedAt != ignore) 6: updatedAt as DateTime?,
    });
  }
}

extension StreakRecordQueryUpdate on IsarQuery<StreakRecord> {
  _StreakRecordQueryUpdate get updateFirst =>
      _StreakRecordQueryUpdateImpl(this, limit: 1);

  _StreakRecordQueryUpdate get updateAll => _StreakRecordQueryUpdateImpl(this);
}

class _StreakRecordQueryBuilderUpdateImpl implements _StreakRecordQueryUpdate {
  const _StreakRecordQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<StreakRecord, StreakRecord, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? type = ignore,
    Object? currentCount = ignore,
    Object? bestCount = ignore,
    Object? lastQualifiedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (type != ignore) 1: type as String?,
        if (currentCount != ignore) 2: currentCount as int?,
        if (bestCount != ignore) 3: bestCount as int?,
        if (lastQualifiedAt != ignore) 4: lastQualifiedAt as DateTime?,
        if (createdAt != ignore) 5: createdAt as DateTime?,
        if (updatedAt != ignore) 6: updatedAt as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension StreakRecordQueryBuilderUpdate
    on QueryBuilder<StreakRecord, StreakRecord, QOperations> {
  _StreakRecordQueryUpdate get updateFirst =>
      _StreakRecordQueryBuilderUpdateImpl(this, limit: 1);

  _StreakRecordQueryUpdate get updateAll =>
      _StreakRecordQueryBuilderUpdateImpl(this);
}

extension StreakRecordQueryFilter
    on QueryBuilder<StreakRecord, StreakRecord, QFilterCondition> {
  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 0, value: value));
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 0, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 1, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  typeGreaterThan(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  typeGreaterThanOrEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition> typeLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 1, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  typeLessThanOrEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  typeStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition> typeContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition> typeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(property: 1, value: ''),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(property: 1, value: ''),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  currentCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 2, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  currentCountGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 2, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  currentCountGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 2, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  currentCountLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 2, value: value));
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  currentCountLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 2, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  currentCountBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 2, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  bestCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  bestCountGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  bestCountGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  bestCountLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 3, value: value));
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  bestCountLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  bestCountBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 3, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  lastQualifiedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  lastQualifiedAtIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  lastQualifiedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  lastQualifiedAtGreaterThan(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  lastQualifiedAtGreaterThanOrEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  lastQualifiedAtLessThan(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 4, value: value));
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  lastQualifiedAtLessThanOrEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 4, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  lastQualifiedAtBetween(DateTime? lower, DateTime? upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 4, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  createdAtGreaterThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  createdAtLessThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 5, value: value));
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  createdAtLessThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 5, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  createdAtBetween(DateTime lower, DateTime upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 5, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 6, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 6, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  updatedAtGreaterThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 6, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  updatedAtLessThan(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 6, value: value));
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  updatedAtLessThanOrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 6, value: value),
      );
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterFilterCondition>
  updatedAtBetween(DateTime lower, DateTime upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 6, lower: lower, upper: upper),
      );
    });
  }
}

extension StreakRecordQueryObject
    on QueryBuilder<StreakRecord, StreakRecord, QFilterCondition> {}

extension StreakRecordQuerySortBy
    on QueryBuilder<StreakRecord, StreakRecord, QSortBy> {
  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortByTypeDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortByCurrentCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy>
  sortByCurrentCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortByBestCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortByBestCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy>
  sortByLastQualifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy>
  sortByLastQualifiedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension StreakRecordQuerySortThenBy
    on QueryBuilder<StreakRecord, StreakRecord, QSortThenBy> {
  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenByTypeDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenByCurrentCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy>
  thenByCurrentCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenByBestCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenByBestCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy>
  thenByLastQualifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy>
  thenByLastQualifiedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension StreakRecordQueryWhereDistinct
    on QueryBuilder<StreakRecord, StreakRecord, QDistinct> {
  QueryBuilder<StreakRecord, StreakRecord, QAfterDistinct> distinctByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterDistinct>
  distinctByCurrentCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterDistinct>
  distinctByBestCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterDistinct>
  distinctByLastQualifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<StreakRecord, StreakRecord, QAfterDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }
}

extension StreakRecordQueryProperty1
    on QueryBuilder<StreakRecord, StreakRecord, QProperty> {
  QueryBuilder<StreakRecord, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<StreakRecord, String, QAfterProperty> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<StreakRecord, int, QAfterProperty> currentCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<StreakRecord, int, QAfterProperty> bestCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<StreakRecord, DateTime?, QAfterProperty>
  lastQualifiedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<StreakRecord, DateTime, QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<StreakRecord, DateTime, QAfterProperty> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension StreakRecordQueryProperty2<R>
    on QueryBuilder<StreakRecord, R, QAfterProperty> {
  QueryBuilder<StreakRecord, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<StreakRecord, (R, String), QAfterProperty> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<StreakRecord, (R, int), QAfterProperty> currentCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<StreakRecord, (R, int), QAfterProperty> bestCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<StreakRecord, (R, DateTime?), QAfterProperty>
  lastQualifiedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<StreakRecord, (R, DateTime), QAfterProperty>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<StreakRecord, (R, DateTime), QAfterProperty>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension StreakRecordQueryProperty3<R1, R2>
    on QueryBuilder<StreakRecord, (R1, R2), QAfterProperty> {
  QueryBuilder<StreakRecord, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<StreakRecord, (R1, R2, String), QOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<StreakRecord, (R1, R2, int), QOperations>
  currentCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<StreakRecord, (R1, R2, int), QOperations> bestCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<StreakRecord, (R1, R2, DateTime?), QOperations>
  lastQualifiedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<StreakRecord, (R1, R2, DateTime), QOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<StreakRecord, (R1, R2, DateTime), QOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}
