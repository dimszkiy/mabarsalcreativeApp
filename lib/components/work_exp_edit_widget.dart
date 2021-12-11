import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkExpEditWidget extends StatefulWidget {
  const WorkExpEditWidget({
    Key key,
    this.workExperience,
  }) : super(key: key);

  final DocumentReference workExperience;

  @override
  _WorkExpEditWidgetState createState() => _WorkExpEditWidgetState();
}

class _WorkExpEditWidgetState extends State<WorkExpEditWidget> {
  DateTime datePicked1;
  DateTime datePicked2;
  TextEditingController companyController;
  TextEditingController postitionTitleController;
  TextEditingController textController3;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WorkHistoryRecord>>(
      stream: queryWorkHistoryRecord(
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
        List<WorkHistoryRecord> containerWorkHistoryRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final containerWorkHistoryRecord =
            containerWorkHistoryRecordList.isNotEmpty
                ? containerWorkHistoryRecordList.first
                : null;
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.tertiaryColor,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 5,
                  indent: 150,
                  endIndent: 150,
                  color: Color(0xFFDADADA),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                  child: Text(
                    'Work Experience',
                    style: FlutterFlowTheme.title2.override(
                      fontFamily: 'Lexend Deca',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                  child: Text(
                    'Add Credentials below.',
                    style: FlutterFlowTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: TextFormField(
                          controller: postitionTitleController ??=
                              TextEditingController(
                            text: containerWorkHistoryRecord.jobTitle,
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Position Title',
                            labelStyle: FlutterFlowTheme.title3.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayIcon400,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
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
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: TextFormField(
                          controller: companyController ??=
                              TextEditingController(
                            text: containerWorkHistoryRecord.companyName,
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Company',
                            labelStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayIcon400,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.darkText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: FlutterFlowTheme.lineColor,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: InkWell(
                                onTap: () async {
                                  await DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    onConfirm: (date) {
                                      setState(() => datePicked1 = date);
                                    },
                                    currentTime: getCurrentTimestamp,
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.48,
                                  height: 50,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.lineColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Start Date',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: FlutterFlowTheme
                                                    .grayIcon400,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3, 0, 0, 0),
                                              child: Text(
                                                dateTimeFormat(
                                                    'yMMMd', datePicked1),
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 16, 0),
                                          child: Icon(
                                            Icons.calendar_today_outlined,
                                            color: FlutterFlowTheme.grayIcon400,
                                            size: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  onConfirm: (date) {
                                    setState(() => datePicked2 = date);
                                  },
                                  currentTime: getCurrentTimestamp,
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.48,
                                height: 50,
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.tertiaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0xFFDADADA),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'End Date',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.grayIcon400,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3, 0, 0, 0),
                                            child: Text(
                                              dateTimeFormat(
                                                  'yMMMd', datePicked2),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          color: FlutterFlowTheme.grayIcon400,
                                          size: 24,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController3 ??=
                                    TextEditingController(
                                  text:
                                      containerWorkHistoryRecord.jobDescription,
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'What did you do here?',
                                  labelStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.grayIcon400,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 12),
                                ),
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.darkText,
                                ),
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: FlutterFlowTheme.lineColor,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final workHistoryUpdateData =
                                    createWorkHistoryRecordData(
                                  jobTitle: containerWorkHistoryRecord.jobTitle,
                                  companyName:
                                      containerWorkHistoryRecord.companyName,
                                  startDate: datePicked1,
                                  endDate: datePicked2,
                                  jobDescription:
                                      containerWorkHistoryRecord.jobDescription,
                                  user: currentUserReference,
                                );
                                await containerWorkHistoryRecord.reference
                                    .update(workHistoryUpdateData);
                                Navigator.pop(context);
                              },
                              text: 'Save Work Experience',
                              options: FFButtonOptions(
                                width: 270,
                                height: 50,
                                color: FlutterFlowTheme.darkText,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 8,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
