import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../job_post_applied/job_post_applied_widget.dart';
import '../job_post_my_job_applicants/job_post_my_job_applicants_widget.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MAINServiceOrderedWidget extends StatefulWidget {
  const MAINServiceOrderedWidget({Key key}) : super(key: key);

  @override
  _MAINServiceOrderedWidgetState createState() =>
      _MAINServiceOrderedWidgetState();
}

class _MAINServiceOrderedWidgetState extends State<MAINServiceOrderedWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.darkText,
        automaticallyImplyLeading: false,
        title: Text(
          'My Service Order',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Lexend Deca',
            color: FlutterFlowTheme.tertiaryColor,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.darkText,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              duration: Duration(milliseconds: 250),
              reverseDuration: Duration(milliseconds: 250),
              child: NavBarPage(initialPage: 'MAINHome'),
            ),
          );
        },
        backgroundColor: Colors.black,
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 48,
          icon: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.tertiaryColor,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: FlutterFlowTheme.secondaryColor,
                    unselectedLabelColor: FlutterFlowTheme.grayIcon,
                    labelStyle: GoogleFonts.getFont(
                      'Roboto',
                    ),
                    indicatorColor: FlutterFlowTheme.secondaryColor,
                    tabs: [
                      Tab(
                        text: 'Saved',
                      ),
                      Tab(
                        text: 'Posted',
                      )
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.background,
                          ),
                          child: StreamBuilder<List<AppliedJobsRecord>>(
                            stream: queryAppliedJobsRecord(
                              queryBuilder: (appliedJobsRecord) =>
                                  appliedJobsRecord
                                      .where('userApplied',
                                          isEqualTo: currentUserReference)
                                      .orderBy('appliedTime', descending: true),
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
                                  listViewAppliedJobsRecordList = snapshot.data;
                              if (listViewAppliedJobsRecordList.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/noAppliedJobs@2x.png',
                                    width: 270,
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewAppliedJobsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewAppliedJobsRecord =
                                      listViewAppliedJobsRecordList[
                                          listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: StreamBuilder<JobPostsRecord>(
                                      stream: JobPostsRecord.getDocument(
                                          listViewAppliedJobsRecord.jobApplied),
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
                                        final jobPostCardJobPostsRecord =
                                            snapshot.data;
                                        return Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                color: Color(0x3E000000),
                                                offset: Offset(0, 1),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      JobPostAppliedWidget(
                                                    application:
                                                        listViewAppliedJobsRecord,
                                                    jobPostDetails:
                                                        jobPostCardJobPostsRecord
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 8, 0),
                                                        child: Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                          elevation: 2,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2,
                                                                        2,
                                                                        2,
                                                                        2),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/WhatsApp_Image_2021-12-10_at_21.00.07.jpeg',
                                                                width: 32,
                                                                height: 32,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      8, 0, 8),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                jobPostCardJobPostsRecord
                                                                    .serviceType,
                                                                style: FlutterFlowTheme
                                                                    .subtitle1,
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                    child: Text(
                                                                      jobPostCardJobPostsRecord
                                                                          .serviceDescription,
                                                                      style: FlutterFlowTheme
                                                                          .bodyText2,
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .chevron_right_rounded,
                                                        color: FlutterFlowTheme
                                                            .grayIcon400,
                                                        size: 24,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
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
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.background,
                          ),
                          child: StreamBuilder<List<JobPostsRecord>>(
                            stream: queryJobPostsRecord(
                              queryBuilder: (jobPostsRecord) => jobPostsRecord
                                  .where('postedBy',
                                      isEqualTo: currentUserReference)
                                  .orderBy('timeCreated', descending: true),
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
                              List<JobPostsRecord> listViewJobPostsRecordList =
                                  snapshot.data;
                              if (listViewJobPostsRecordList.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/noPostedJobs@2x.png',
                                    width: 260,
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewJobPostsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewJobPostsRecord =
                                      listViewJobPostsRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 6, 16, 6),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                JobPostMyJobApplicantsWidget(
                                              jobPostDetails:
                                                  listViewJobPostsRecord
                                                      .reference,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.tertiaryColor,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x3E000000),
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 4, 8, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 8, 0),
                                                    child: Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                      elevation: 2,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2, 2, 2, 2),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          child: Image.asset(
                                                            'assets/images/logo_Outlook@2x.png',
                                                            width: 32,
                                                            height: 32,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 8, 0, 0),
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
                                                            listViewJobPostsRecord
                                                                .jobName,
                                                            style:
                                                                FlutterFlowTheme
                                                                    .subtitle1,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewJobPostsRecord
                                                                        .jobCompany,
                                                                    'Kaleo Design',
                                                                  ),
                                                                  style: FlutterFlowTheme
                                                                      .bodyText2,
                                                                ),
                                                              ),
                                                              Text(
                                                                '\$${listViewJobPostsRecord.salary}k',
                                                                style: FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme
                                                                      .primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: FlutterFlowTheme
                                                        .grayIcon400,
                                                    size: 24,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 8, 12, 12),
                                                    child: Text(
                                                      listViewJobPostsRecord
                                                          .jobDescription
                                                          .maybeHandleOverflow(
                                                        maxChars: 120,
                                                        replacement: '…',
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .bodyText2,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
