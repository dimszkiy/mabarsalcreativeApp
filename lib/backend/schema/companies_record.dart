import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'companies_record.g.dart';

abstract class CompaniesRecord
    implements Built<CompaniesRecord, CompaniesRecordBuilder> {
  static Serializer<CompaniesRecord> get serializer =>
      _$companiesRecordSerializer;

  @nullable
  String get companyName;

  @nullable
  String get companyLogo;

  @nullable
  String get companyHero;

  @nullable
  String get companyDescription;

  @nullable
  LatLng get companyLocation;

  @nullable
  String get companyCity;

  @nullable
  String get companyWebSite;

  @nullable
  String get companySize;

  @nullable
  DocumentReference get employees;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CompaniesRecordBuilder builder) => builder
    ..companyName = ''
    ..companyLogo = ''
    ..companyHero = ''
    ..companyDescription = ''
    ..companyCity = ''
    ..companyWebSite = ''
    ..companySize = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static CompaniesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CompaniesRecord(
        (c) => c
          ..companyName = snapshot.data['companyName']
          ..companyLogo = snapshot.data['companyLogo']
          ..companyHero = snapshot.data['companyHero']
          ..companyDescription = snapshot.data['companyDescription']
          ..companyLocation = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..companyCity = snapshot.data['companyCity']
          ..companyWebSite = snapshot.data['companyWebSite']
          ..companySize = snapshot.data['companySize']
          ..employees = safeGet(() => toRef(snapshot.data['employees']))
          ..reference = CompaniesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CompaniesRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'companies',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CompaniesRecord._();
  factory CompaniesRecord([void Function(CompaniesRecordBuilder) updates]) =
      _$CompaniesRecord;

  static CompaniesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCompaniesRecordData({
  String companyName,
  String companyLogo,
  String companyHero,
  String companyDescription,
  LatLng companyLocation,
  String companyCity,
  String companyWebSite,
  String companySize,
  DocumentReference employees,
}) =>
    serializers.toFirestore(
        CompaniesRecord.serializer,
        CompaniesRecord((c) => c
          ..companyName = companyName
          ..companyLogo = companyLogo
          ..companyHero = companyHero
          ..companyDescription = companyDescription
          ..companyLocation = companyLocation
          ..companyCity = companyCity
          ..companyWebSite = companyWebSite
          ..companySize = companySize
          ..employees = employees));
