// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetSignRecordCollection on Isar {
  IsarCollection<SignRecord> get signRecords => collection();
}

const SignRecordSchema = CollectionSchema(
  name: r'SignRecord',
  schema:
      r'{"name":"SignRecord","idName":"id","properties":[{"name":"dateTimeSignIn","type":"Long"},{"name":"dateTimeSignOut","type":"Long"},{"name":"uid","type":"String"}],"indexes":[{"name":"uid","unique":false,"replace":false,"properties":[{"name":"uid","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: r'id',
  propertyIds: {r'dateTimeSignIn': 0, r'dateTimeSignOut': 1, r'uid': 2},
  listProperties: {},
  indexIds: {r'uid': 0},
  indexValueTypes: {
    r'uid': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _signRecordGetId,
  setId: _signRecordSetId,
  getLinks: _signRecordGetLinks,
  attachLinks: _signRecordAttachLinks,
  serializeNative: _signRecordSerializeNative,
  deserializeNative: _signRecordDeserializeNative,
  deserializePropNative: _signRecordDeserializePropNative,
  serializeWeb: _signRecordSerializeWeb,
  deserializeWeb: _signRecordDeserializeWeb,
  deserializePropWeb: _signRecordDeserializePropWeb,
  version: 4,
);

int? _signRecordGetId(SignRecord object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _signRecordSetId(SignRecord object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _signRecordGetLinks(SignRecord object) {
  return [];
}

void _signRecordSerializeNative(
    IsarCollection<SignRecord> collection,
    IsarCObject cObj,
    SignRecord object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  IsarUint8List? uid$Bytes;
  final uid$Value = object.uid;
  if (uid$Value != null) {
    uid$Bytes = IsarBinaryWriter.utf8Encoder.convert(uid$Value);
  }
  final size = (staticSize + 3 + (uid$Bytes?.length ?? 0)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeDateTime(offsets[0], object.dateTimeSignIn);
  writer.writeDateTime(offsets[1], object.dateTimeSignOut);
  writer.writeByteList(offsets[2], uid$Bytes);
}

SignRecord _signRecordDeserializeNative(IsarCollection<SignRecord> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = SignRecord();
  object.dateTimeSignIn = reader.readDateTimeOrNull(offsets[0]);
  object.dateTimeSignOut = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.uid = reader.readStringOrNull(offsets[2]);
  return object;
}

P _signRecordDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _signRecordSerializeWeb(
    IsarCollection<SignRecord> collection, SignRecord object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'dateTimeSignIn',
      object.dateTimeSignIn?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, r'dateTimeSignOut',
      object.dateTimeSignOut?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'uid', object.uid);
  return jsObj;
}

SignRecord _signRecordDeserializeWeb(
    IsarCollection<SignRecord> collection, Object jsObj) {
  final object = SignRecord();
  object.dateTimeSignIn =
      IsarNative.jsObjectGet(jsObj, r'dateTimeSignIn') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'dateTimeSignIn') as int,
                  isUtc: true)
              .toLocal()
          : null;
  object.dateTimeSignOut =
      IsarNative.jsObjectGet(jsObj, r'dateTimeSignOut') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'dateTimeSignOut') as int,
                  isUtc: true)
              .toLocal()
          : null;
  object.id = IsarNative.jsObjectGet(jsObj, r'id');
  object.uid = IsarNative.jsObjectGet(jsObj, r'uid');
  return object;
}

P _signRecordDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'dateTimeSignIn':
      return (IsarNative.jsObjectGet(jsObj, r'dateTimeSignIn') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'dateTimeSignIn') as int,
                  isUtc: true)
              .toLocal()
          : null) as P;
    case r'dateTimeSignOut':
      return (IsarNative.jsObjectGet(jsObj, r'dateTimeSignOut') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'dateTimeSignOut') as int,
                  isUtc: true)
              .toLocal()
          : null) as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id')) as P;
    case r'uid':
      return (IsarNative.jsObjectGet(jsObj, r'uid')) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _signRecordAttachLinks(
    IsarCollection<dynamic> col, int id, SignRecord object) {}

extension SignRecordQueryWhereSort
    on QueryBuilder<SignRecord, SignRecord, QWhere> {
  QueryBuilder<SignRecord, SignRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SignRecordQueryWhere
    on QueryBuilder<SignRecord, SignRecord, QWhereClause> {
  QueryBuilder<SignRecord, SignRecord, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterWhereClause> idNotEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterWhereClause> uidEqualTo(
      String? uid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [uid],
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterWhereClause> uidNotEqualTo(
      String? uid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [],
              upper: [uid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [uid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [uid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [],
              upper: [uid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterWhereClause> uidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [null],
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterWhereClause> uidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }
}

extension SignRecordQueryFilter
    on QueryBuilder<SignRecord, SignRecord, QFilterCondition> {
  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition>
      dateTimeSignInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateTimeSignIn',
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition>
      dateTimeSignInEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTimeSignIn',
        value: value,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition>
      dateTimeSignInGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTimeSignIn',
        value: value,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition>
      dateTimeSignInLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTimeSignIn',
        value: value,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition>
      dateTimeSignInBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTimeSignIn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition>
      dateTimeSignOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateTimeSignOut',
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition>
      dateTimeSignOutEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTimeSignOut',
        value: value,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition>
      dateTimeSignOutGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTimeSignOut',
        value: value,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition>
      dateTimeSignOutLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTimeSignOut',
        value: value,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition>
      dateTimeSignOutBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTimeSignOut',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> uidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uid',
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> uidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> uidGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> uidLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> uidBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> uidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterFilterCondition> uidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }
}

extension SignRecordQueryLinks
    on QueryBuilder<SignRecord, SignRecord, QFilterCondition> {}

extension SignRecordQueryWhereSortBy
    on QueryBuilder<SignRecord, SignRecord, QSortBy> {
  QueryBuilder<SignRecord, SignRecord, QAfterSortBy> sortByDateTimeSignIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTimeSignIn', Sort.asc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy>
      sortByDateTimeSignInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTimeSignIn', Sort.desc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy> sortByDateTimeSignOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTimeSignOut', Sort.asc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy>
      sortByDateTimeSignOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTimeSignOut', Sort.desc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension SignRecordQueryWhereSortThenBy
    on QueryBuilder<SignRecord, SignRecord, QSortThenBy> {
  QueryBuilder<SignRecord, SignRecord, QAfterSortBy> thenByDateTimeSignIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTimeSignIn', Sort.asc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy>
      thenByDateTimeSignInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTimeSignIn', Sort.desc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy> thenByDateTimeSignOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTimeSignOut', Sort.asc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy>
      thenByDateTimeSignOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTimeSignOut', Sort.desc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<SignRecord, SignRecord, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension SignRecordQueryWhereDistinct
    on QueryBuilder<SignRecord, SignRecord, QDistinct> {
  QueryBuilder<SignRecord, SignRecord, QDistinct> distinctByDateTimeSignIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTimeSignIn');
    });
  }

  QueryBuilder<SignRecord, SignRecord, QDistinct> distinctByDateTimeSignOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTimeSignOut');
    });
  }

  QueryBuilder<SignRecord, SignRecord, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension SignRecordQueryProperty
    on QueryBuilder<SignRecord, SignRecord, QQueryProperty> {
  QueryBuilder<SignRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SignRecord, DateTime?, QQueryOperations>
      dateTimeSignInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTimeSignIn');
    });
  }

  QueryBuilder<SignRecord, DateTime?, QQueryOperations>
      dateTimeSignOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTimeSignOut');
    });
  }

  QueryBuilder<SignRecord, String?, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}
