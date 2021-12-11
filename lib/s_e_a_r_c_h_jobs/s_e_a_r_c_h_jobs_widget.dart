import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../consultation/consultation_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SEARCHJobsWidget extends StatefulWidget {
  const SEARCHJobsWidget({Key key}) : super(key: key);

  @override
  _SEARCHJobsWidgetState createState() => _SEARCHJobsWidgetState();
}

class _SEARCHJobsWidgetState extends State<SEARCHJobsWidget> {
  List<JobPostsRecord> algoliaSearchResults = [];
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.darkText,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.tertiaryColor,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.darkText,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x3C000000),
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: TextFormField(
                        controller: textController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Search...',
                          labelStyle: FlutterFlowTheme.subtitle1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.grayIcon400,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 12, 8),
                        ),
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.search_sharp,
                      color: FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    onPressed: () async {
                      setState(() => algoliaSearchResults = null);
                      await JobPostsRecord.search(
                        term: textController.text,
                      )
                          .then((r) => algoliaSearchResults = r)
                          .onError((_, __) => algoliaSearchResults = [])
                          .whenComplete(() => setState(() {}));
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<JobPostsRecord>>(
              future: JobPostsRecord.search(
                term: textController.text,
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
                List<JobPostsRecord> listViewJobPostsRecordList = snapshot.data;
                if (listViewJobPostsRecordList.isEmpty) {
                  return Center(
                    child: Image.asset(
                      'assets/images/noJobPosts@2x.png',
                      width: 200,
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
                      padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
                      child: StreamBuilder<JobPostsRecord>(
                        stream: JobPostsRecord.getDocument(
                            listViewJobPostsRecord.reference),
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
                          final jobPostCardJobPostsRecord = snapshot.data;
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConsultationWidget(
                                    jobPostDetails:
                                        jobPostCardJobPostsRecord.reference,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.tertiaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x3E000000),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 4, 8, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2, 2, 2, 2),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    jobPostCardJobPostsRecord
                                                        .companyLogo,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/robin-job-posts-c6sczn/assets/bsxr9ltsqtg9/logo@2x.png',
                                                  ),
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  jobPostCardJobPostsRecord
                                                      .serviceType,
                                                  style: FlutterFlowTheme
                                                      .subtitle1,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        child: Text(
                                                          currentUserUid,
                                                          style:
                                                              FlutterFlowTheme
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
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          color: FlutterFlowTheme.grayIcon400,
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
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 8, 12, 12),
                                          child: AutoSizeText(
                                            jobPostCardJobPostsRecord
                                                .serviceDescription
                                                .maybeHandleOverflow(
                                              maxChars: 120,
                                              replacement: '…',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.bodyText2,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 12, 12),
                                        child: AutoSizeText(
                                          'Posted On:',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.grayIcon400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 12, 12),
                                        child: AutoSizeText(
                                          dateTimeFormat(
                                              'relative',
                                              jobPostCardJobPostsRecord
                                                  .timeCreated),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.grayIcon,
                                          ),
                                        ),
                                      )
                                    ],
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
          )
        ],
      ),
    );
  }
}
