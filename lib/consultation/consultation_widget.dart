import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../consultation_order/consultation_order_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class ConsultationWidget extends StatefulWidget {
  const ConsultationWidget({
    Key key,
    this.likedJob,
    this.jobPostDetails,
  }) : super(key: key);

  final DocumentReference likedJob;
  final DocumentReference jobPostDetails;

  @override
  _ConsultationWidgetState createState() => _ConsultationWidgetState();
}

class _ConsultationWidgetState extends State<ConsultationWidget> {
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
        final consultationJobPostsRecord = snapshot.data;
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
                                Image.network(
                                  valueOrDefault<String>(
                                    consultationJobPostsRecord.photoHero,
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
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/WhatsApp_Image_2021-11-20_at_21.38.44.jpeg',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                                  onPressed: () async {
                                                    await Share.share(
                                                        valueOrDefault<String>(
                                                      consultationJobPostsRecord
                                                          .jobName,
                                                      'https://thisisawesome.com',
                                                    ));
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
                                                        !consultationJobPostsRecord
                                                            .likedPost,
                                                  );
                                                  await consultationJobPostsRecord
                                                      .reference
                                                      .update(
                                                          jobPostsUpdateData);
                                                },
                                                value:
                                                    consultationJobPostsRecord
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
                                      'Consultation',
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
                                  AuthUserStreamWidget(
                                    child: Text(
                                      currentUserUid,
                                      style: FlutterFlowTheme.bodyText2,
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
                                      consultationJobPostsRecord
                                          .serviceDescription,
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
                                      consultationJobPostsRecord
                                          .serviceRequirements,
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
                                    'Skills & Expertise',
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
                                      consultationJobPostsRecord
                                          .preferredSkills,
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
                    Visibility(
                      visible: !(consultationJobPostsRecord.myJob) ?? true,
                      child: Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 36),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  consultationJobPostsRecord.postedBy),
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
                                final buttonUsersRecord = snapshot.data;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ConsultationOrderWidget(
                                          jobPostDetails:
                                              consultationJobPostsRecord
                                                  .reference,
                                        ),
                                      ),
                                    );
                                  },
                                  text: 'ORDER NOW',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: Colors.black,
                                    textStyle:
                                        FlutterFlowTheme.subtitle1.override(
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
                                );
                              },
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
