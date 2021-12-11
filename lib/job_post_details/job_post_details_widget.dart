import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class JobPostDetailsWidget extends StatefulWidget {
  const JobPostDetailsWidget({
    Key key,
    this.likedJob,
    this.jobPostDetails,
  }) : super(key: key);

  final DocumentReference likedJob;
  final DocumentReference jobPostDetails;

  @override
  _JobPostDetailsWidgetState createState() => _JobPostDetailsWidgetState();
}

class _JobPostDetailsWidgetState extends State<JobPostDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<JobPostsRecord>>(
      stream: queryJobPostsRecord(
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
        List<JobPostsRecord> jobPostDetailsJobPostsRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final jobPostDetailsJobPostsRecord =
            jobPostDetailsJobPostsRecordList.isNotEmpty
                ? jobPostDetailsJobPostsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 96),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/https---blogs-images.forbes.com-alexknapp-files-2016-09-proton-launch-1200x814.jpg',
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                              child: Image.asset(
                                                'assets/images/spaceX-Logo-tagline-slogan-motto-mission-vision-founder-owner.jpg',
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
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Material(
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
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  buttonSize: 46,
                                                  icon: Icon(
                                                    Icons.reply_rounded,
                                                    color: FlutterFlowTheme
                                                        .tertiaryColor,
                                                    size: 16,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
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
                                              child: ToggleIcon(
                                                onPressed: () async {
                                                  final jobPostsUpdateData =
                                                      createJobPostsRecordData(
                                                    likedPost:
                                                        !jobPostDetailsJobPostsRecord
                                                            .likedPost,
                                                  );
                                                  await jobPostDetailsJobPostsRecord
                                                      .reference
                                                      .update(
                                                          jobPostsUpdateData);
                                                },
                                                value:
                                                    jobPostDetailsJobPostsRecord
                                                        .likedPost,
                                                onIcon: Icon(
                                                  Icons.favorite_rounded,
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                  size: 16,
                                                ),
                                                offIcon: Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: FlutterFlowTheme
                                                      .tertiaryColor,
                                                  size: 16,
                                                ),
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
                                      'Service Post',
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
                                    'Photographer',
                                    style: FlutterFlowTheme.bodyText2,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      '\$1000 - \$2000',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
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
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet nisl orci. Morbi ligula quam, aliquet at tincidunt non, consectetur a lacus. Sed non finibus metus. Maecenas rutrum augue ac dolor pulvinar blandit. Proin blandit libero et magna gravida pulvinar. Aenean pharetra, odio ac rutrum condimentum, erat lorem dapibus ipsum, vel aliquet purus risus sed tortor. Aliquam dignissim gravida diam a tempor. In pretium lobortis erat eu bibendum. Sed ornare dolor sit amet tincidunt posuere. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum nibh sapien, consectetur sed vestibulum vitae, tempus a magna. Sed in euismod diam.',
                                      style: FlutterFlowTheme.bodyText1,
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
                                    'Requirements',
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
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet nisl orci. Morbi ligula quam, aliquet at tincidunt non, consectetur a lacus. Sed non finibus metus. Maecenas rutrum augue ac dolor pulvinar blandit. Proin blandit libero et magna gravida pulvinar. Aenean pharetra, odio ac rutrum condimentum, erat lorem dapibus ipsum, vel aliquet purus risus sed tortor. Aliquam dignissim gravida diam a tempor. In pretium lobortis erat eu bibendum. Sed ornare dolor sit amet tincidunt posuere. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum nibh sapien, consectetur sed vestibulum vitae, tempus a magna. Sed in euismod diam.',
                                      style: FlutterFlowTheme.bodyText1,
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
                                    'Preferred Skills & Expertise',
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
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 16, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet nisl orci. Morbi ligula quam, aliquet at tincidunt non, consectetur a lacus. Sed non finibus metus. Maecenas rutrum augue ac dolor pulvinar blandit. Proin blandit libero et magna gravida pulvinar. Aenean pharetra, odio ac rutrum condimentum, erat lorem dapibus ipsum, vel aliquet purus risus sed tortor. Aliquam dignissim gravida diam a tempor. In pretium lobortis erat eu bibendum. Sed ornare dolor sit amet tincidunt posuere. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum nibh sapien, consectetur sed vestibulum vitae, tempus a magna. Sed in euismod diam.',
                                      style: FlutterFlowTheme.bodyText1,
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
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 36),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Submit Application',
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
              )
            ],
          ),
        );
      },
    );
  }
}
