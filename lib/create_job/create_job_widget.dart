import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateJobWidget extends StatefulWidget {
  const CreateJobWidget({Key key}) : super(key: key);

  @override
  _CreateJobWidgetState createState() => _CreateJobWidgetState();
}

class _CreateJobWidgetState extends State<CreateJobWidget> {
  String experienceLevelValue;
  TextEditingController preferredSkillsController;
  TextEditingController requirementsController;
  TextEditingController shortDescriptionController;
  TextEditingController textController1;
  double salaryRangeValue;
  var placePickerValue = FFPlace();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    preferredSkillsController = TextEditingController();
    requirementsController = TextEditingController();
    shortDescriptionController = TextEditingController();
    textController1 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Create Service Post',
                          style: FlutterFlowTheme.title3,
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.background,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            buttonSize: 46,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.grayIcon400,
                              size: 24,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                    child: StreamBuilder<List<CompaniesRecord>>(
                      stream: queryCompaniesRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitThreeBounce(
                                color: FlutterFlowTheme.primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<CompaniesRecord> rowCompaniesRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final rowCompaniesRecord =
                            rowCompaniesRecordList.isNotEmpty
                                ? rowCompaniesRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.lineColor,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      rowCompaniesRecord.companyLogo,
                                      'https://images.saasworthy.com/flutterflow_13440_logo_1614062469_kgzxm.jpg',
                                    ),
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rowCompaniesRecord.companyName,
                                    style: FlutterFlowTheme.subtitle1,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      rowCompaniesRecord.companyCity,
                                      style: FlutterFlowTheme.bodyText2,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Divider(
                    height: 4,
                    thickness: 1,
                    color: FlutterFlowTheme.lineColor,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Service Name',
                              labelStyle: FlutterFlowTheme.title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayIcon400,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.darkText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: TextFormField(
                            controller: shortDescriptionController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Short Description',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayIcon400,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: TextFormField(
                            controller: requirementsController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Skills & Experiences',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayIcon400,
                              ),
                              hintText:
                                  'Have to have x many years of experience, education, etc...',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayIcon400,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: TextFormField(
                            controller: preferredSkillsController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Work Example',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayIcon400,
                              ),
                              hintText: 'Knowledge of software or processes...',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayIcon400,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: FlutterFlowTheme.lineColor,
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: FlutterFlowDropDown(
                            options: [
                              '< 6 Months',
                              '6m - 1y',
                              '1y - 3y',
                              '+3 years',
                              '+5 years',
                              '+8 years'
                            ].toList(),
                            onChanged: (val) =>
                                setState(() => experienceLevelValue = val),
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.darkText,
                            ),
                            icon: FaIcon(
                              FontAwesomeIcons.chevronDown,
                              color: FlutterFlowTheme.grayIcon400,
                              size: 16,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                            hidesUnderline: true,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Salary',
                          style: FlutterFlowTheme.bodyText1,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$1,000',
                          style: FlutterFlowTheme.bodyText2,
                        ),
                        Text(
                          '\$5,000+',
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.bodyText2,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Slider(
                      activeColor: FlutterFlowTheme.secondaryColor,
                      inactiveColor: Color(0xFF9E9E9E),
                      min: 40000,
                      max: 160000,
                      value: salaryRangeValue ??= 100000,
                      label: salaryRangeValue.toString(),
                      divisions: 24,
                      onChanged: (newValue) {
                        setState(() => salaryRangeValue = newValue);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: FlutterFlowTheme.lineColor,
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: FlutterFlowPlacePicker(
                            iOSGoogleMapsApiKey: '',
                            androidGoogleMapsApiKey: '',
                            webGoogleMapsApiKey: '',
                            onSelect: (place) =>
                                setState(() => placePickerValue = place),
                            defaultText: 'Location',
                            icon: Icon(
                              Icons.place,
                              color: FlutterFlowTheme.grayIcon400,
                              size: 16,
                            ),
                            buttonOptions: FFButtonOptions(
                              width: 200,
                              height: 40,
                              color: FlutterFlowTheme.tertiaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayIcon400,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x33000000),
                    offset: Offset(0, -1),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 36),
                child: FFButtonWidget(
                  onPressed: () async {
                    final jobPostsCreateData = createJobPostsRecordData(
                      jobName: textController1.text,
                      jobDescription: shortDescriptionController.text,
                      jobCompany: '',
                      salary: salaryRangeValue.toString(),
                      timeCreated: getCurrentTimestamp,
                      jobLocation: placePickerValue.latLng,
                      postedBy: currentUserReference,
                      jobRequirements: requirementsController.text,
                      jobPreferredSkills: experienceLevelValue,
                      myJob: true,
                    );
                    await JobPostsRecord.collection
                        .doc()
                        .set(jobPostsCreateData);
                    Navigator.pop(context);
                  },
                  text: 'Create Post',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: Colors.black,
                    textStyle: FlutterFlowTheme.subtitle1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
