// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_progress_record.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetAchievementProgressRecordCollection on Isar {
  IsarCollection<int, AchievementProgressRecord>
      get achievementProgressRecords => this.collection();
}

const AchievementProgressRecordSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'AchievementProgressRecord',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'achievementId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'progress',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'isUnlocked',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'unlockedAt',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'createdAt',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'updatedAt',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'achievementId',
        properties: [
          "achievementId",
        ],
        unique: true,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, AchievementProgressRecord>(
    serialize: serializeAchievementProgressRecord,
    deserialize: deserializeAchievementProgressRecord,
    deserializeProperty: deserializeAchievementProgressRecordProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeAchievementProgressRecord(
    IsarWriter writer, AchievementProgressRecord object) {
  IsarCore.writeString(writer, 1, object.achievementId);
  IsarCore.writeLong(writer, 2, object.progress);
  IsarCore.writeBool(writer, 3, object.isUnlocked);
  IsarCore.writeLong(
      writer,
      4,
      object.unlockedAt?.toUtc().microsecondsSinceEpoch ??
          -9223372036854775808);
  IsarCore.writeLong(
      writer, 5, object.createdAt.toUtc().microsecondsSinceEpoch);
  IsarCore.writeLong(
      writer, 6, object.updatedAt.toUtc().microsecondsSinceEpoch);
  return object.id;
}

@isarProtected
AchievementProgressRecord deserializeAchievementProgressRecord(
    IsarReader reader) {
  final object = AchievementProgressRecord();
  object.id = IsarCore.readId(reader);
  object.achievementId = IsarCore.readString(reader, 1) ?? '';
  object.progress = IsarCore.readLong(reader, 2);
  object.isUnlocked = IsarCore.readBool(reader, 3);
  {
    final value = IsarCore.readLong(reader, 4);
    if (value == -9223372036854775808) {
      object.unlockedAt = null;
    } else {
      object.unlockedAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  {
    final value = IsarCore.readLong(reader, 5);
    if (value == -9223372036854775808) {
      object.createdAt =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.createdAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  {
    final value = IsarCore.readLong(reader, 6);
    if (value == -9223372036854775808) {
      object.updatedAt =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.updatedAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  return object;
}

@isarProtected
dynamic deserializeAchievementProgressRecordProp(
    IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readLong(reader, 2);
    case 3:
      return IsarCore.readBool(reader, 3);
    case 4:
      {
        final value = IsarCore.readLong(reader, 4);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 5:
      {
        final value = IsarCore.readLong(reader, 5);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 6:
      {
        final value = IsarCore.readLong(reader, 6);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _AchievementProgressRecordUpdate {
  bool call({
    required int id,
    String? achievementId,
    int? progress,
    bool? isUnlocked,
    DateTime? unlockedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _AchievementProgressRecordUpdateImpl
    implements _AchievementProgressRecordUpdate {
  const _AchievementProgressRecordUpdateImpl(this.collection);

  final IsarCollection<int, AchievementProgressRecord> collection;

  @override
  bool call({
    required int id,
    Object? achievementId = ignore,
    Object? progress = ignore,
    Object? isUnlocked = ignore,
    Object? unlockedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (achievementId != ignore) 1: achievementId as String?,
          if (progress != ignore) 2: progress as int?,
          if (isUnlocked != ignore) 3: isUnlocked as bool?,
          if (unlockedAt != ignore) 4: unlockedAt as DateTime?,
          if (createdAt != ignore) 5: createdAt as DateTime?,
          if (updatedAt != ignore) 6: updatedAt as DateTime?,
        }) >
        0;
  }
}

sealed class _AchievementProgressRecordUpdateAll {
  int call({
    required List<int> id,
    String? achievementId,
    int? progress,
    bool? isUnlocked,
    DateTime? unlockedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _AchievementProgressRecordUpdateAllImpl
    implements _AchievementProgressRecordUpdateAll {
  const _AchievementProgressRecordUpdateAllImpl(this.collection);

  final IsarCollection<int, AchievementProgressRecord> collection;

  @override
  int call({
    required List<int> id,
    Object? achievementId = ignore,
    Object? progress = ignore,
    Object? isUnlocked = ignore,
    Object? unlockedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return collection.updateProperties(id, {
      if (achievementId != ignore) 1: achievementId as String?,
      if (progress != ignore) 2: progress as int?,
      if (isUnlocked != ignore) 3: isUnlocked as bool?,
      if (unlockedAt != ignore) 4: unlockedAt as DateTime?,
      if (createdAt != ignore) 5: createdAt as DateTime?,
      if (updatedAt != ignore) 6: updatedAt as DateTime?,
    });
  }
}

extension AchievementProgressRecordUpdate
    on IsarCollection<int, AchievementProgressRecord> {
  _AchievementProgressRecordUpdate get update =>
      _AchievementProgressRecordUpdateImpl(this);

  _AchievementProgressRecordUpdateAll get updateAll =>
      _AchievementProgressRecordUpdateAllImpl(this);
}

sealed class _AchievementProgressRecordQueryUpdate {
  int call({
    String? achievementId,
    int? progress,
    bool? isUnlocked,
    DateTime? unlockedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

class _AchievementProgressRecordQueryUpdateImpl
    implements _AchievementProgressRecordQueryUpdate {
  const _AchievementProgressRecordQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<AchievementProgressRecord> query;
  final int? limit;

  @override
  int call({
    Object? achievementId = ignore,
    Object? progress = ignore,
    Object? isUnlocked = ignore,
    Object? unlockedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (achievementId != ignore) 1: achievementId as String?,
      if (progress != ignore) 2: progress as int?,
      if (isUnlocked != ignore) 3: isUnlocked as bool?,
      if (unlockedAt != ignore) 4: unlockedAt as DateTime?,
      if (createdAt != ignore) 5: createdAt as DateTime?,
      if (updatedAt != ignore) 6: updatedAt as DateTime?,
    });
  }
}

extension AchievementProgressRecordQueryUpdate
    on IsarQuery<AchievementProgressRecord> {
  _AchievementProgressRecordQueryUpdate get updateFirst =>
      _AchievementProgressRecordQueryUpdateImpl(this, limit: 1);

  _AchievementProgressRecordQueryUpdate get updateAll =>
      _AchievementProgressRecordQueryUpdateImpl(this);
}

class _AchievementProgressRecordQueryBuilderUpdateImpl
    implements _AchievementProgressRecordQueryUpdate {
  const _AchievementProgressRecordQueryBuilderUpdateImpl(this.query,
      {this.limit});

  final QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QOperations> query;
  final int? limit;

  @override
  int call({
    Object? achievementId = ignore,
    Object? progress = ignore,
    Object? isUnlocked = ignore,
    Object? unlockedAt = ignore,
    Object? createdAt = ignore,
    Object? updatedAt = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (achievementId != ignore) 1: achievementId as String?,
        if (progress != ignore) 2: progress as int?,
        if (isUnlocked != ignore) 3: isUnlocked as bool?,
        if (unlockedAt != ignore) 4: unlockedAt as DateTime?,
        if (createdAt != ignore) 5: createdAt as DateTime?,
        if (updatedAt != ignore) 6: updatedAt as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension AchievementProgressRecordQueryBuilderUpdate on QueryBuilder<
    AchievementProgressRecord, AchievementProgressRecord, QOperations> {
  _AchievementProgressRecordQueryUpdate get updateFirst =>
      _AchievementProgressRecordQueryBuilderUpdateImpl(this, limit: 1);

  _AchievementProgressRecordQueryUpdate get updateAll =>
      _AchievementProgressRecordQueryBuilderUpdateImpl(this);
}

extension AchievementProgressRecordQueryFilter on QueryBuilder<
    AchievementProgressRecord, AchievementProgressRecord, QFilterCondition> {
  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> achievementIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> achievementIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> achievementIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> achievementIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> achievementIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> achievementIdBetween(
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

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> achievementIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> achievementIdEndsWith(
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

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
          QAfterFilterCondition>
      achievementIdContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
          QAfterFilterCondition>
      achievementIdMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> achievementIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> achievementIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> progressEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> progressGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> progressGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> progressLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> progressLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> progressBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> isUnlockedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> unlockedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> unlockedAtIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> unlockedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> unlockedAtGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> unlockedAtGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> unlockedAtLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> unlockedAtLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> unlockedAtBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> createdAtGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> createdAtGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> createdAtLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> createdAtLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> updatedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> updatedAtGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> updatedAtLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension AchievementProgressRecordQueryObject on QueryBuilder<
    AchievementProgressRecord, AchievementProgressRecord, QFilterCondition> {}

extension AchievementProgressRecordQuerySortBy on QueryBuilder<
    AchievementProgressRecord, AchievementProgressRecord, QSortBy> {
  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByAchievementId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByAchievementIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByIsUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension AchievementProgressRecordQuerySortThenBy on QueryBuilder<
    AchievementProgressRecord, AchievementProgressRecord, QSortThenBy> {
  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByAchievementId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByAchievementIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByIsUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension AchievementProgressRecordQueryWhereDistinct on QueryBuilder<
    AchievementProgressRecord, AchievementProgressRecord, QDistinct> {
  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterDistinct> distinctByAchievementId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterDistinct> distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterDistinct> distinctByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterDistinct> distinctByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<AchievementProgressRecord, AchievementProgressRecord,
      QAfterDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }
}

extension AchievementProgressRecordQueryProperty1 on QueryBuilder<
    AchievementProgressRecord, AchievementProgressRecord, QProperty> {
  QueryBuilder<AchievementProgressRecord, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<AchievementProgressRecord, String, QAfterProperty>
      achievementIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<AchievementProgressRecord, int, QAfterProperty>
      progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<AchievementProgressRecord, bool, QAfterProperty>
      isUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<AchievementProgressRecord, DateTime?, QAfterProperty>
      unlockedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<AchievementProgressRecord, DateTime, QAfterProperty>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<AchievementProgressRecord, DateTime, QAfterProperty>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension AchievementProgressRecordQueryProperty2<R>
    on QueryBuilder<AchievementProgressRecord, R, QAfterProperty> {
  QueryBuilder<AchievementProgressRecord, (R, int), QAfterProperty>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R, String), QAfterProperty>
      achievementIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R, int), QAfterProperty>
      progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R, bool), QAfterProperty>
      isUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R, DateTime?), QAfterProperty>
      unlockedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R, DateTime), QAfterProperty>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R, DateTime), QAfterProperty>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension AchievementProgressRecordQueryProperty3<R1, R2>
    on QueryBuilder<AchievementProgressRecord, (R1, R2), QAfterProperty> {
  QueryBuilder<AchievementProgressRecord, (R1, R2, int), QOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R1, R2, String), QOperations>
      achievementIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R1, R2, int), QOperations>
      progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R1, R2, bool), QOperations>
      isUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R1, R2, DateTime?), QOperations>
      unlockedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R1, R2, DateTime), QOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<AchievementProgressRecord, (R1, R2, DateTime), QOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}
