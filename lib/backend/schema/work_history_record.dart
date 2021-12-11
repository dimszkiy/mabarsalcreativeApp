import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'work_history_record.g.dart';

abstract class WorkHistoryRecord
    implements Built<WorkHistoryRecord, WorkHistoryRecordBuilder> {
  static Serializer<WorkHistoryRecord> get serializer =>
      _$workHistoryRecordSerializer;

  @nullable
  String get jobTitle;

  @nullable
  String get companyName;

  @nullable
  DateTime get startDate;

  @nullable
  DateTime get endDate;

  @nullable
  String get jobDescription;

  @nullable
  DocumentReference get user;

  @nullable
  String get companyLogo;

  @nullable
  String get serviceType;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(WorkHistoryRecordBuilder builder) => builder
    ..jobTitle = ''
    ..companyName = ''
    ..jobDescription = ''
    ..companyLogo = ''
    ..serviceType = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workHistory');

  static Stream<WorkHistoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static WorkHistoryRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      WorkHistoryRecord(
        (c) => c
          ..jobTitle = snapshot.data['jobTitle']
          ..companyName = snapshot.data['companyName']
          ..startDate = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['startDate']))
          ..endDate = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['endDate']))
          ..jobDescription = snapshot.data['jobDescription']
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..companyLogo = snapshot.data['companyLogo']
          ..serviceType = snapshot.data['serviceType']
          ..reference = WorkHistoryRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<WorkHistoryRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'workHistory',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  WorkHistoryRecord._();
  factory WorkHistoryRecord([void Function(WorkHistoryRecordBuilder) updates]) =
      _$WorkHistoryRecord;

  static WorkHistoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createWorkHistoryRecordData({
  String jobTitle,
  String companyName,
  DateTime startDate,
  DateTime endDate,
  String jobDescription,
  DocumentReference user,
  String companyLogo,
  String serviceType,
}) =>
    serializers.toFirestore(
        WorkHistoryRecord.serializer,
        WorkHistoryRecord((w) => w
          ..jobTitle = jobTitle
          ..companyName = companyName
          ..startDate = startDate
          ..endDate = endDate
          ..jobDescription = jobDescription
          ..user = user
          ..companyLogo = companyLogo
          ..serviceType = serviceType));
