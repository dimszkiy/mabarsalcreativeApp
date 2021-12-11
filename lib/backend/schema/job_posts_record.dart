import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'job_posts_record.g.dart';

abstract class JobPostsRecord
    implements Built<JobPostsRecord, JobPostsRecordBuilder> {
  static Serializer<JobPostsRecord> get serializer =>
      _$jobPostsRecordSerializer;

  @nullable
  String get jobName;

  @nullable
  String get jobCompany;

  @nullable
  String get salary;

  @nullable
  String get jobDescription;

  @nullable
  DateTime get timeCreated;

  @nullable
  LatLng get jobLocation;

  @nullable
  DocumentReference get postedBy;

  @nullable
  bool get likedPost;

  @nullable
  String get jobRequirements;

  @nullable
  String get jobPreferredSkills;

  @nullable
  String get companyLogo;

  @nullable
  String get photoHero;

  @nullable
  bool get myJob;

  @nullable
  String get serviceType;

  @nullable
  String get serviceDescription;

  @nullable
  String get serviceRequirements;

  @nullable
  String get preferredSkills;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(JobPostsRecordBuilder builder) => builder
    ..jobName = ''
    ..jobCompany = ''
    ..salary = ''
    ..jobDescription = ''
    ..likedPost = false
    ..jobRequirements = ''
    ..jobPreferredSkills = ''
    ..companyLogo = ''
    ..photoHero = ''
    ..myJob = false
    ..serviceType = ''
    ..serviceDescription = ''
    ..serviceRequirements = ''
    ..preferredSkills = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jobPosts');

  static Stream<JobPostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static JobPostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      JobPostsRecord(
        (c) => c
          ..jobName = snapshot.data['jobName']
          ..jobCompany = snapshot.data['jobCompany']
          ..salary = snapshot.data['salary']
          ..jobDescription = snapshot.data['jobDescription']
          ..timeCreated = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['timeCreated']))
          ..jobLocation = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..postedBy = safeGet(() => toRef(snapshot.data['postedBy']))
          ..likedPost = snapshot.data['likedPost']
          ..jobRequirements = snapshot.data['jobRequirements']
          ..jobPreferredSkills = snapshot.data['jobPreferredSkills']
          ..companyLogo = snapshot.data['companyLogo']
          ..photoHero = snapshot.data['photoHero']
          ..myJob = snapshot.data['myJob']
          ..serviceType = snapshot.data['serviceType']
          ..serviceDescription = snapshot.data['serviceDescription']
          ..serviceRequirements = snapshot.data['serviceRequirements']
          ..preferredSkills = snapshot.data['preferredSkills']
          ..reference = JobPostsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<JobPostsRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'jobPosts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  JobPostsRecord._();
  factory JobPostsRecord([void Function(JobPostsRecordBuilder) updates]) =
      _$JobPostsRecord;

  static JobPostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createJobPostsRecordData({
  String jobName,
  String jobCompany,
  String salary,
  String jobDescription,
  DateTime timeCreated,
  LatLng jobLocation,
  DocumentReference postedBy,
  bool likedPost,
  String jobRequirements,
  String jobPreferredSkills,
  String companyLogo,
  String photoHero,
  bool myJob,
  String serviceType,
  String serviceDescription,
  String serviceRequirements,
  String preferredSkills,
}) =>
    serializers.toFirestore(
        JobPostsRecord.serializer,
        JobPostsRecord((j) => j
          ..jobName = jobName
          ..jobCompany = jobCompany
          ..salary = salary
          ..jobDescription = jobDescription
          ..timeCreated = timeCreated
          ..jobLocation = jobLocation
          ..postedBy = postedBy
          ..likedPost = likedPost
          ..jobRequirements = jobRequirements
          ..jobPreferredSkills = jobPreferredSkills
          ..companyLogo = companyLogo
          ..photoHero = photoHero
          ..myJob = myJob
          ..serviceType = serviceType
          ..serviceDescription = serviceDescription
          ..serviceRequirements = serviceRequirements
          ..preferredSkills = preferredSkills));
