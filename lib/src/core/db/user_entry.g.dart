// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetUserEntryCollection on Isar {
  IsarCollection<UserEntry> get userEntrys => collection();
}

const UserEntrySchema = CollectionSchema(
  name: r'UserEntry',
  schema:
      r'{"name":"UserEntry","idName":"id","properties":[{"name":"name","type":"String"},{"name":"uid","type":"String"}],"indexes":[{"name":"uid","unique":true,"replace":false,"properties":[{"name":"uid","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: r'id',
  propertyIds: {r'name': 0, r'uid': 1},
  listProperties: {},
  indexIds: {r'uid': 0},
  indexValueTypes: {
    r'uid': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _userEntryGetId,
  setId: _userEntrySetId,
  getLinks: _userEntryGetLinks,
  attachLinks: _userEntryAttachLinks,
  serializeNative: _userEntrySerializeNative,
  deserializeNative: _userEntryDeserializeNative,
  deserializePropNative: _userEntryDeserializePropNative,
  serializeWeb: _userEntrySerializeWeb,
  deserializeWeb: _userEntryDeserializeWeb,
  deserializePropWeb: _userEntryDeserializePropWeb,
  version: 4,
);

int? _userEntryGetId(UserEntry object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _userEntrySetId(UserEntry object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _userEntryGetLinks(UserEntry object) {
  return [];
}

void _userEntrySerializeNative(
    IsarCollection<UserEntry> collection,
    IsarCObject cObj,
    UserEntry object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  IsarUint8List? name$Bytes;
  final name$Value = object.name;
  if (name$Value != null) {
    name$Bytes = IsarBinaryWriter.utf8Encoder.convert(name$Value);
  }
  IsarUint8List? uid$Bytes;
  final uid$Value = object.uid;
  if (uid$Value != null) {
    uid$Bytes = IsarBinaryWriter.utf8Encoder.convert(uid$Value);
  }
  final size = (staticSize +
      3 +
      (name$Bytes?.length ?? 0) +
      3 +
      (uid$Bytes?.length ?? 0)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeByteList(offsets[0], name$Bytes);
  writer.writeByteList(offsets[1], uid$Bytes);
}

UserEntry _userEntryDeserializeNative(IsarCollection<UserEntry> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = UserEntry(
    name: reader.readStringOrNull(offsets[0]),
  );
  object.id = id;
  object.uid = reader.readStringOrNull(offsets[1]);
  return object;
}

P _userEntryDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _userEntrySerializeWeb(
    IsarCollection<UserEntry> collection, UserEntry object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'name', object.name);
  IsarNative.jsObjectSet(jsObj, r'uid', object.uid);
  return jsObj;
}

UserEntry _userEntryDeserializeWeb(
    IsarCollection<UserEntry> collection, Object jsObj) {
  final object = UserEntry(
    name: IsarNative.jsObjectGet(jsObj, r'name'),
  );
  object.id = IsarNative.jsObjectGet(jsObj, r'id');
  object.uid = IsarNative.jsObjectGet(jsObj, r'uid');
  return object;
}

P _userEntryDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id')) as P;
    case r'name':
      return (IsarNative.jsObjectGet(jsObj, r'name')) as P;
    case r'uid':
      return (IsarNative.jsObjectGet(jsObj, r'uid')) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _userEntryAttachLinks(
    IsarCollection<dynamic> col, int id, UserEntry object) {}

extension UserEntryByIndex on IsarCollection<UserEntry> {
  Future<UserEntry?> getByUid(String? uid) {
    return getByIndex(r'uid', [uid]);
  }

  UserEntry? getByUidSync(String? uid) {
    return getByIndexSync(r'uid', [uid]);
  }

  Future<bool> deleteByUid(String? uid) {
    return deleteByIndex(r'uid', [uid]);
  }

  bool deleteByUidSync(String? uid) {
    return deleteByIndexSync(r'uid', [uid]);
  }

  Future<List<UserEntry?>> getAllByUid(List<String?> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uid', values);
  }

  List<UserEntry?> getAllByUidSync(List<String?> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uid', values);
  }

  Future<int> deleteAllByUid(List<String?> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uid', values);
  }

  int deleteAllByUidSync(List<String?> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uid', values);
  }

  Future<int> putByUid(UserEntry object) {
    return putByIndex(r'uid', object);
  }

  int putByUidSync(UserEntry object, {bool saveLinks = true}) {
    return putByIndexSync(r'uid', object, saveLinks: saveLinks);
  }

  Future<List<int>> putAllByUid(List<UserEntry> objects) {
    return putAllByIndex(r'uid', objects);
  }

  List<int> putAllByUidSync(List<UserEntry> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uid', objects, saveLinks: saveLinks);
  }
}

extension UserEntryQueryWhereSort
    on QueryBuilder<UserEntry, UserEntry, QWhere> {
  QueryBuilder<UserEntry, UserEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserEntryQueryWhere
    on QueryBuilder<UserEntry, UserEntry, QWhereClause> {
  QueryBuilder<UserEntry, UserEntry, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<UserEntry, UserEntry, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterWhereClause> idBetween(
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

  QueryBuilder<UserEntry, UserEntry, QAfterWhereClause> uidEqualTo(
      String? uid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [uid],
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterWhereClause> uidNotEqualTo(
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

  QueryBuilder<UserEntry, UserEntry, QAfterWhereClause> uidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [null],
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterWhereClause> uidIsNotNull() {
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

extension UserEntryQueryFilter
    on QueryBuilder<UserEntry, UserEntry, QFilterCondition> {
  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> uidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uid',
      ));
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> uidEqualTo(
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

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> uidGreaterThan(
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

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> uidLessThan(
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

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> uidBetween(
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

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> uidStartsWith(
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

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> uidEndsWith(
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

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> uidContains(
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

  QueryBuilder<UserEntry, UserEntry, QAfterFilterCondition> uidMatches(
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

extension UserEntryQueryLinks
    on QueryBuilder<UserEntry, UserEntry, QFilterCondition> {}

extension UserEntryQueryWhereSortBy
    on QueryBuilder<UserEntry, UserEntry, QSortBy> {
  QueryBuilder<UserEntry, UserEntry, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension UserEntryQueryWhereSortThenBy
    on QueryBuilder<UserEntry, UserEntry, QSortThenBy> {
  QueryBuilder<UserEntry, UserEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<UserEntry, UserEntry, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension UserEntryQueryWhereDistinct
    on QueryBuilder<UserEntry, UserEntry, QDistinct> {
  QueryBuilder<UserEntry, UserEntry, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserEntry, UserEntry, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension UserEntryQueryProperty
    on QueryBuilder<UserEntry, UserEntry, QQueryProperty> {
  QueryBuilder<UserEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserEntry, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<UserEntry, String?, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetFaceDescriptorCollection on Isar {
  IsarCollection<FaceDescriptor> get faceDescriptors => collection();
}

const FaceDescriptorSchema = CollectionSchema(
  name: r'FaceDescriptor',
  schema:
      r'{"name":"FaceDescriptor","idName":"id","properties":[{"name":"createdAt","type":"Long"},{"name":"encodingLength","type":"Long"},{"name":"encodingSet","type":"DoubleList"},{"name":"uid","type":"String"}],"indexes":[{"name":"uid","unique":true,"replace":false,"properties":[{"name":"uid","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: r'id',
  propertyIds: {
    r'createdAt': 0,
    r'encodingLength': 1,
    r'encodingSet': 2,
    r'uid': 3
  },
  listProperties: {r'encodingSet'},
  indexIds: {r'uid': 0},
  indexValueTypes: {
    r'uid': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _faceDescriptorGetId,
  setId: _faceDescriptorSetId,
  getLinks: _faceDescriptorGetLinks,
  attachLinks: _faceDescriptorAttachLinks,
  serializeNative: _faceDescriptorSerializeNative,
  deserializeNative: _faceDescriptorDeserializeNative,
  deserializePropNative: _faceDescriptorDeserializePropNative,
  serializeWeb: _faceDescriptorSerializeWeb,
  deserializeWeb: _faceDescriptorDeserializeWeb,
  deserializePropWeb: _faceDescriptorDeserializePropWeb,
  version: 4,
);

int? _faceDescriptorGetId(FaceDescriptor object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _faceDescriptorSetId(FaceDescriptor object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _faceDescriptorGetLinks(FaceDescriptor object) {
  return [];
}

void _faceDescriptorSerializeNative(
    IsarCollection<FaceDescriptor> collection,
    IsarCObject cObj,
    FaceDescriptor object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  IsarUint8List? uid$Bytes;
  final uid$Value = object.uid;
  if (uid$Value != null) {
    uid$Bytes = IsarBinaryWriter.utf8Encoder.convert(uid$Value);
  }
  final size = (staticSize +
      3 +
      (object.encodingSet?.length ?? 0) * 8 +
      3 +
      (uid$Bytes?.length ?? 0)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.encodingLength);
  writer.writeDoubleList(offsets[2], object.encodingSet);
  writer.writeByteList(offsets[3], uid$Bytes);
}

FaceDescriptor _faceDescriptorDeserializeNative(
    IsarCollection<FaceDescriptor> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = FaceDescriptor();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.encodingSet = reader.readDoubleList(offsets[2]);
  object.id = id;
  object.uid = reader.readStringOrNull(offsets[3]);
  return object;
}

P _faceDescriptorDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDoubleList(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _faceDescriptorSerializeWeb(
    IsarCollection<FaceDescriptor> collection, FaceDescriptor object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, r'createdAt', object.createdAt?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, r'encodingLength', object.encodingLength);
  IsarNative.jsObjectSet(jsObj, r'encodingSet', object.encodingSet);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'uid', object.uid);
  return jsObj;
}

FaceDescriptor _faceDescriptorDeserializeWeb(
    IsarCollection<FaceDescriptor> collection, Object jsObj) {
  final object = FaceDescriptor();
  object.createdAt = IsarNative.jsObjectGet(jsObj, r'createdAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, r'createdAt') as int,
              isUtc: true)
          .toLocal()
      : null;
  object.encodingSet = (IsarNative.jsObjectGet(jsObj, r'encodingSet') as List?)
      ?.map((e) => e ?? double.negativeInfinity)
      .toList()
      .cast<double>();
  object.id = IsarNative.jsObjectGet(jsObj, r'id');
  object.uid = IsarNative.jsObjectGet(jsObj, r'uid');
  return object;
}

P _faceDescriptorDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'createdAt':
      return (IsarNative.jsObjectGet(jsObj, r'createdAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'createdAt') as int,
                  isUtc: true)
              .toLocal()
          : null) as P;
    case r'encodingLength':
      return (IsarNative.jsObjectGet(jsObj, r'encodingLength') ??
          (double.negativeInfinity as int)) as P;
    case r'encodingSet':
      return ((IsarNative.jsObjectGet(jsObj, r'encodingSet') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<double>()) as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id')) as P;
    case r'uid':
      return (IsarNative.jsObjectGet(jsObj, r'uid')) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _faceDescriptorAttachLinks(
    IsarCollection<dynamic> col, int id, FaceDescriptor object) {}

extension FaceDescriptorByIndex on IsarCollection<FaceDescriptor> {
  Future<FaceDescriptor?> getByUid(String? uid) {
    return getByIndex(r'uid', [uid]);
  }

  FaceDescriptor? getByUidSync(String? uid) {
    return getByIndexSync(r'uid', [uid]);
  }

  Future<bool> deleteByUid(String? uid) {
    return deleteByIndex(r'uid', [uid]);
  }

  bool deleteByUidSync(String? uid) {
    return deleteByIndexSync(r'uid', [uid]);
  }

  Future<List<FaceDescriptor?>> getAllByUid(List<String?> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uid', values);
  }

  List<FaceDescriptor?> getAllByUidSync(List<String?> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uid', values);
  }

  Future<int> deleteAllByUid(List<String?> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uid', values);
  }

  int deleteAllByUidSync(List<String?> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uid', values);
  }

  Future<int> putByUid(FaceDescriptor object) {
    return putByIndex(r'uid', object);
  }

  int putByUidSync(FaceDescriptor object, {bool saveLinks = true}) {
    return putByIndexSync(r'uid', object, saveLinks: saveLinks);
  }

  Future<List<int>> putAllByUid(List<FaceDescriptor> objects) {
    return putAllByIndex(r'uid', objects);
  }

  List<int> putAllByUidSync(List<FaceDescriptor> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uid', objects, saveLinks: saveLinks);
  }
}

extension FaceDescriptorQueryWhereSort
    on QueryBuilder<FaceDescriptor, FaceDescriptor, QWhere> {
  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FaceDescriptorQueryWhere
    on QueryBuilder<FaceDescriptor, FaceDescriptor, QWhereClause> {
  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterWhereClause> idEqualTo(
      int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterWhereClause> idNotEqualTo(
      int id) {
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterWhereClause> idBetween(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterWhereClause> uidEqualTo(
      String? uid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [uid],
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterWhereClause> uidNotEqualTo(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterWhereClause> uidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [null],
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterWhereClause>
      uidIsNotNull() {
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

extension FaceDescriptorQueryFilter
    on QueryBuilder<FaceDescriptor, FaceDescriptor, QFilterCondition> {
  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      encodingLengthEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encodingLength',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      encodingLengthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'encodingLength',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      encodingLengthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'encodingLength',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      encodingLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'encodingLength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      encodingSetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'encodingSet',
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      encodingSetElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.equalTo(
        property: r'encodingSet',
        value: null,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      encodingSetElementGreaterThan(double? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'encodingSet',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      encodingSetElementLessThan(double? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        property: r'encodingSet',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      encodingSetElementBetween(double? lower, double? upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'encodingSet',
        lower: lower,
        includeLower: false,
        upper: upper,
        includeUpper: false,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      uidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uid',
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      uidEqualTo(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      uidGreaterThan(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      uidLessThan(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      uidBetween(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      uidStartsWith(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      uidEndsWith(
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

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }
}

extension FaceDescriptorQueryLinks
    on QueryBuilder<FaceDescriptor, FaceDescriptor, QFilterCondition> {}

extension FaceDescriptorQueryWhereSortBy
    on QueryBuilder<FaceDescriptor, FaceDescriptor, QSortBy> {
  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy>
      sortByEncodingLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encodingLength', Sort.asc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy>
      sortByEncodingLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encodingLength', Sort.desc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension FaceDescriptorQueryWhereSortThenBy
    on QueryBuilder<FaceDescriptor, FaceDescriptor, QSortThenBy> {
  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy>
      thenByEncodingLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encodingLength', Sort.asc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy>
      thenByEncodingLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encodingLength', Sort.desc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension FaceDescriptorQueryWhereDistinct
    on QueryBuilder<FaceDescriptor, FaceDescriptor, QDistinct> {
  QueryBuilder<FaceDescriptor, FaceDescriptor, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QDistinct>
      distinctByEncodingLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encodingLength');
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QDistinct>
      distinctByEncodingSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encodingSet');
    });
  }

  QueryBuilder<FaceDescriptor, FaceDescriptor, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension FaceDescriptorQueryProperty
    on QueryBuilder<FaceDescriptor, FaceDescriptor, QQueryProperty> {
  QueryBuilder<FaceDescriptor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FaceDescriptor, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FaceDescriptor, int, QQueryOperations> encodingLengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encodingLength');
    });
  }

  QueryBuilder<FaceDescriptor, List<double>?, QQueryOperations>
      encodingSetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encodingSet');
    });
  }

  QueryBuilder<FaceDescriptor, String?, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}
