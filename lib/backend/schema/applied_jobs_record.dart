import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'applied_jobs_record.g.dart';

abstract class AppliedJobsRecord
    implements Built<AppliedJobsRecord, AppliedJobsRecordBuilder> {
  static Serializer<AppliedJobsRecord> get serializer =>
      _$appliedJobsRecordSerializer;

  @nullable
  DocumentReference get jobApplied;

  @nullable
  DocumentReference get userApplied;

  @nullable
  DateTime get appliedTime;

  @nullable
  String get coverLetter;

  @nullable
  @BuiltValueField(wireName: 'image_1')
  String get image1;

  @nullable
  @BuiltValueField(wireName: 'image_2')
  String get image2;

  @nullable
  @BuiltValueField(wireName: 'image_3')
  String get image3;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AppliedJobsRecordBuilder builder) => builder
    ..coverLetter = ''
    ..image1 = ''
    ..image2 = ''
    ..image3 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appliedJobs');

  static Stream<AppliedJobsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static AppliedJobsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AppliedJobsRecord(
        (c) => c
          ..jobApplied = safeGet(() => toRef(snapshot.data['jobApplied']))
          ..userApplied = safeGet(() => toRef(snapshot.data['userApplied']))
          ..appliedTime = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['appliedTime']))
          ..coverLetter = snapshot.data['coverLetter']
          ..image1 = snapshot.data['image_1']
          ..image2 = snapshot.data['image_2']
          ..image3 = snapshot.data['image_3']
          ..reference = AppliedJobsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AppliedJobsRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'appliedJobs',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  AppliedJobsRecord._();
  factory AppliedJobsRecord([void Function(AppliedJobsRecordBuilder) updates]) =
      _$AppliedJobsRecord;

  static AppliedJobsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAppliedJobsRecordData({
  DocumentReference jobApplied,
  DocumentReference userApplied,
  DateTime appliedTime,
  String coverLetter,
  String image1,
  String image2,
  String image3,
}) =>
    serializers.toFirestore(
        AppliedJobsRecord.serializer,
        AppliedJobsRecord((a) => a
          ..jobApplied = jobApplied
          ..userApplied = userApplied
          ..appliedTime = appliedTime
          ..coverLetter = coverLetter
          ..image1 = image1
          ..image2 = image2
          ..image3 = image3));
