import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key key}) : super(key: key);

  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  TextEditingController emailAddressController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.chevron_left_rounded,
          color: FlutterFlowTheme.darkText,
          size: 32,
        ),
        title: Text(
          'Forgot Password',
          style: FlutterFlowTheme.subtitle1,
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
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
            child: TextFormField(
              controller: emailAddressController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Your Email',
                labelStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.grayIcon400,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                hintText: 'Please enter a valid email...',
                hintStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0x98FFFFFF),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.lineColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.lineColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.tertiaryColor,
              ),
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.darkText,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
                    style: FlutterFlowTheme.bodyText2,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                if (emailAddressController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Email required!',
                      ),
                    ),
                  );
                  return;
                }
                await resetPassword(
                  email: emailAddressController.text,
                  context: context,
                );
              },
              text: 'Send Reset Password',
              options: FFButtonOptions(
                width: 230,
                height: 50,
                color: Colors.black,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.tertiaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                elevation: 3,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
