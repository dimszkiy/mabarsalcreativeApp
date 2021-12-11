import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get bio;

  @nullable
  String get positionTitle;

  @nullable
  String get experienceLevel;

  @nullable
  String get currentCompany;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  bool get likedPosts;

  @nullable
  String get profileType;

  @nullable
  String get salary;

  @nullable
  DocumentReference get company;

  @nullable
  bool get isGuest;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..displayName = ''
    ..email = ''
    ..password = ''
    ..photoUrl = ''
    ..bio = ''
    ..positionTitle = ''
    ..experienceLevel = ''
    ..currentCompany = ''
    ..uid = ''
    ..phoneNumber = ''
    ..likedPosts = false
    ..profileType = ''
    ..salary = ''
    ..isGuest = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..displayName = snapshot.data['display_name']
          ..email = snapshot.data['email']
          ..password = snapshot.data['password']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..photoUrl = snapshot.data['photo_url']
          ..bio = snapshot.data['bio']
          ..positionTitle = snapshot.data['positionTitle']
          ..experienceLevel = snapshot.data['experienceLevel']
          ..currentCompany = snapshot.data['currentCompany']
          ..uid = snapshot.data['uid']
          ..phoneNumber = snapshot.data['phone_number']
          ..likedPosts = snapshot.data['likedPosts']
          ..profileType = snapshot.data['profileType']
          ..salary = snapshot.data['salary']
          ..company = safeGet(() => toRef(snapshot.data['company']))
          ..isGuest = snapshot.data['isGuest']
          ..reference = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String displayName,
  String email,
  String password,
  DateTime createdTime,
  String photoUrl,
  String bio,
  String positionTitle,
  String experienceLevel,
  String currentCompany,
  String uid,
  String phoneNumber,
  bool likedPosts,
  String profileType,
  String salary,
  DocumentReference company,
  bool isGuest,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..displayName = displayName
          ..email = email
          ..password = password
          ..createdTime = createdTime
          ..photoUrl = photoUrl
          ..bio = bio
          ..positionTitle = positionTitle
          ..experienceLevel = experienceLevel
          ..currentCompany = currentCompany
          ..uid = uid
          ..phoneNumber = phoneNumber
          ..likedPosts = likedPosts
          ..profileType = profileType
          ..salary = salary
          ..company = company
          ..isGuest = isGuest));
