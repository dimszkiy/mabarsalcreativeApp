import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class JobPostMyJobApplicantsWidget extends StatefulWidget {
  const JobPostMyJobApplicantsWidget({
    Key key,
    this.jobPostDetails,
  }) : super(key: key);

  final DocumentReference jobPostDetails;

  @override
  _JobPostMyJobApplicantsWidgetState createState() =>
      _JobPostMyJobApplicantsWidgetState();
}

class _JobPostMyJobApplicantsWidgetState
    extends State<JobPostMyJobApplicantsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<JobPostsRecord>(
      stream: JobPostsRecord.getDocument(widget.jobPostDetails),
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
        final jobPostMyJobApplicantsJobPostsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                valueOrDefault<String>(
                                  jobPostMyJobApplicantsJobPostsRecord
                                      .photoHero,
                                  'https://static.independent.co.uk/2021/07/20/13/spacex%20starship%20launch%20latest.jpg?width=982&height=726&auto=webp&quality=75',
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.8, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 175, 0, 0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-0.84, 0.88),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 2, 2, 2),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                jobPostMyJobApplicantsJobPostsRecord
                                                    .companyLogo,
                                                'https://24activenews.com/wp-content/uploads/2021/04/23-04-2021_SpaceX.jpg',
                                              ),
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 40, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      shape: const CircleBorder(),
                                      child: Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: Color(0x66000000),
                                          shape: BoxShape.circle,
                                        ),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          buttonSize: 46,
                                          icon: Icon(
                                            Icons.chevron_left_rounded,
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            size: 24,
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0,
                                          shape: const CircleBorder(),
                                          child: Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: Color(0x66000000),
                                              shape: BoxShape.circle,
                                            ),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              buttonSize: 46,
                                              icon: Icon(
                                                Icons.reply_rounded,
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                                size: 16,
                                              ),
                                              onPressed: () async {
                                                await Share.share(
                                                    valueOrDefault<String>(
                                                  jobPostMyJobApplicantsJobPostsRecord
                                                      .jobName,
                                                  'This is a really great job!',
                                                ));
                                              },
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    jobPostMyJobApplicantsJobPostsRecord
                                        .jobName,
                                    style: FlutterFlowTheme.title3,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  jobPostMyJobApplicantsJobPostsRecord
                                      .jobCompany,
                                  style: FlutterFlowTheme.bodyText2,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    '\$${jobPostMyJobApplicantsJobPostsRecord.salary}k',
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Description',
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    jobPostMyJobApplicantsJobPostsRecord
                                        .jobDescription,
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.lineColor,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Your Applicants',
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: StreamBuilder<List<AppliedJobsRecord>>(
                                stream: queryAppliedJobsRecord(
                                  queryBuilder: (appliedJobsRecord) =>
                                      appliedJobsRecord
                                          .where(
                                              'jobApplied',
                                              isEqualTo:
                                                  jobPostMyJobApplicantsJobPostsRecord
                                                      .reference)
                                          .orderBy('appliedTime',
                                              descending: true),
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
                                  List<AppliedJobsRecord>
                                      listViewAppliedJobsRecordList =
                                      snapshot.data;
                                  if (listViewAppliedJobsRecordList.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/noAppliedJobs@2x.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 330,
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewAppliedJobsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewAppliedJobsRecord =
                                          listViewAppliedJobsRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 6, 0, 6),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              listViewAppliedJobsRecord
                                                  .userApplied),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            final containerUsersRecord =
                                                snapshot.data;
                                            return Container(
                                              width: 100,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: FlutterFlowTheme
                                                      .lineColor,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 0, 0, 0),
                                                    child: Container(
                                                      width: 60,
                                                      height: 60,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          containerUsersRecord
                                                              .photoUrl,
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/health-ai-mj6puy/assets/hu4vs0lstizz/UI_avatar_2@3x.png',
                                                        ),
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          containerUsersRecord
                                                              .displayName,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                containerUsersRecord
                                                                    .positionTitle,
                                                                style: FlutterFlowTheme
                                                                    .bodyText2,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  '\$${containerUsersRecord.salary}k'
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        16,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme
                                                                      .bodyText2
                                                                      .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
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
        );
      },
    );
  }
}
