import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyDetailsWidget extends StatefulWidget {
  const CompanyDetailsWidget({
    Key key,
    this.companyDetails,
  }) : super(key: key);

  final DocumentReference companyDetails;

  @override
  _CompanyDetailsWidgetState createState() => _CompanyDetailsWidgetState();
}

class _CompanyDetailsWidgetState extends State<CompanyDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CompaniesRecord>>(
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
        List<CompaniesRecord> companyDetailsCompaniesRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final companyDetailsCompaniesRecord =
            companyDetailsCompaniesRecordList.isNotEmpty
                ? companyDetailsCompaniesRecordList.first
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
                                Image.network(
                                  valueOrDefault<String>(
                                    companyDetailsCompaniesRecord.companyHero,
                                    'https://pbs.twimg.com/media/E6s4ZjGUUAEInfM.jpg',
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
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  companyDetailsCompaniesRecord
                                                      .companyLogo,
                                                  'https://media-exp1.licdn.com/dms/image/C560BAQEbqLQ-JE0vdQ/company-logo_200_200/0/1546981484841?e=2159024400&v=beta&t=f60no4w5DV2toGVzTyGvPIpCk2LTWLwP9UQJIR2dpmI',
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
                                      companyDetailsCompaniesRecord.companyName,
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
                                    companyDetailsCompaniesRecord.companySize,
                                    style: FlutterFlowTheme.bodyText2,
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
                                      companyDetailsCompaniesRecord
                                          .companyDescription,
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
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
