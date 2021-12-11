import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../create_profile/create_profile_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../onboarding/onboarding_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyProfileWidget extends StatefulWidget {
  const CompanyProfileWidget({Key key}) : super(key: key);

  @override
  _CompanyProfileWidgetState createState() => _CompanyProfileWidgetState();
}

class _CompanyProfileWidgetState extends State<CompanyProfileWidget> {
  String companySizeValue;
  String uploadedFileUrl2 = '';
  TextEditingController companyNameController;
  TextEditingController websiteController;
  TextEditingController descriptionController;
  TextEditingController locationController;
  String uploadedFileUrl1 = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    companyNameController = TextEditingController();
    websiteController = TextEditingController();
    descriptionController = TextEditingController();
    locationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateProfileWidget(),
              ),
            );
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Text(
          'Company Profile',
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.subtitle1.override(
            fontFamily: 'Lexend Deca',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: InkWell(
                  onTap: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: true,
                      backgroundColor: FlutterFlowTheme.darkText,
                      textColor: FlutterFlowTheme.tertiaryColor,
                      pickerFontFamily: 'Lexend Deca',
                    );
                    if (selectedMedia != null &&
                        validateFileFormat(
                            selectedMedia.storagePath, context)) {
                      showUploadMessage(context, 'Uploading file...',
                          showLoading: true);
                      final downloadUrl = await uploadData(
                          selectedMedia.storagePath, selectedMedia.bytes);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      if (downloadUrl != null) {
                        setState(() => uploadedFileUrl1 = downloadUrl);
                        showUploadMessage(context, 'Success!');
                      } else {
                        showUploadMessage(context, 'Failed to upload media');
                        return;
                      }
                    }
                  },
                  child: Image.asset(
                    'assets/images/coverEmpty@2x.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 12, 10, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                  backgroundColor: FlutterFlowTheme.darkText,
                                  textColor: FlutterFlowTheme.tertiaryColor,
                                  pickerFontFamily: 'Lexend Deca',
                                );
                                if (selectedMedia != null &&
                                    validateFileFormat(
                                        selectedMedia.storagePath, context)) {
                                  showUploadMessage(
                                      context, 'Uploading file...',
                                      showLoading: true);
                                  final downloadUrl = await uploadData(
                                      selectedMedia.storagePath,
                                      selectedMedia.bytes);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  if (downloadUrl != null) {
                                    setState(
                                        () => uploadedFileUrl2 = downloadUrl);
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                    return;
                                  }
                                }
                              },
                              child: Image.asset(
                                'assets/images/uploadAvatar@2x.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: TextFormField(
                                controller: companyNameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Company Name',
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
                                ),
                              ),
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
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: TextFormField(
                              controller: websiteController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Website',
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
                              style: FlutterFlowTheme.subtitle2,
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: FlutterFlowTheme.lineColor,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: TextFormField(
                              controller: descriptionController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Company Descriptions',
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
                              style: FlutterFlowTheme.bodyText2,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: FlutterFlowTheme.lineColor,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: FlutterFlowDropDown(
                            initialOption: companySizeValue ??= 'Company Size',
                            options: [
                              'Company Size',
                              '1-10',
                              '11-50',
                              '51-100',
                              '100+'
                            ].toList(),
                            onChanged: (val) =>
                                setState(() => companySizeValue = val),
                            width: 130,
                            height: 40,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayIcon400,
                            ),
                            icon: FaIcon(
                              FontAwesomeIcons.chevronDown,
                              color: FlutterFlowTheme.grayIcon400,
                              size: 20,
                            ),
                            fillColor: Colors.white,
                            elevation: 0,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin: EdgeInsetsDirectional.fromSTEB(8, 4, 16, 4),
                            hidesUnderline: true,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: FlutterFlowTheme.lineColor,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: TextFormField(
                              controller: locationController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Location',
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
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: FlutterFlowTheme.lineColor,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Skip for Now',
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color: FlutterFlowTheme.background,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayIcon400,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              final companiesCreateData =
                                  createCompaniesRecordData(
                                companyName: companyNameController.text,
                                companyHero: uploadedFileUrl1,
                                companyLogo: uploadedFileUrl2,
                                companyDescription: descriptionController.text,
                                companyCity: locationController.text,
                                companySize: companySizeValue,
                                companyWebSite: websiteController.text,
                                employees: currentUserReference,
                              );
                              await CompaniesRecord.collection
                                  .doc()
                                  .set(companiesCreateData);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OnboardingWidget(),
                                ),
                              );
                            },
                            text: 'Continue',
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color: Colors.black,
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
