import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../d_e_t_a_i_l_s_chat/d_e_t_a_i_l_s_chat_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MAINChatWidget extends StatefulWidget {
  const MAINChatWidget({Key key}) : super(key: key);

  @override
  _MAINChatWidgetState createState() => _MAINChatWidgetState();
}

class _MAINChatWidgetState extends State<MAINChatWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.darkText,
        automaticallyImplyLeading: false,
        title: Text(
          'Messages',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Lexend Deca',
            color: FlutterFlowTheme.tertiaryColor,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 1,
      ),
      backgroundColor: FlutterFlowTheme.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
          child: StreamBuilder<List<ChatsRecord>>(
            stream: queryChatsRecord(
              queryBuilder: (chatsRecord) => chatsRecord
                  .where('users', arrayContains: currentUserReference)
                  .orderBy('last_message_time', descending: true),
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
              List<ChatsRecord> listViewChatsRecordList = snapshot.data;
              if (listViewChatsRecordList.isEmpty) {
                return Center(
                  child: Image.asset(
                    'assets/images/empty_NoMessges@2x.png',
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewChatsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewChatsRecord =
                      listViewChatsRecordList[listViewIndex];
                  return StreamBuilder<ChatsRecord>(
                    stream:
                        ChatsRecord.getDocument(listViewChatsRecord.reference),
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
                      final chatPreviewChatsRecord = snapshot.data;
                      return FutureBuilder<UsersRecord>(
                        future: () async {
                          final chatUserRef = FFChatManager.instance
                              .getChatUserRef(
                                  currentUserReference, chatPreviewChatsRecord);
                          return UsersRecord.getDocument(chatUserRef).first;
                        }(),
                        builder: (context, snapshot) {
                          final chatUser = snapshot.data;
                          return FFChatPreview(
                            onTap: chatUser != null
                                ? () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DETAILSChatWidget(
                                          chatUser: chatUser,
                                        ),
                                      ),
                                    )
                                : null,
                            lastChatText: chatPreviewChatsRecord.lastMessage,
                            lastChatTime:
                                chatPreviewChatsRecord.lastMessageTime,
                            seen: chatPreviewChatsRecord.lastMessageSeenBy
                                .contains(currentUserReference),
                            userName: chatUser?.displayName ?? '',
                            userProfilePic: chatUser?.photoUrl ?? '',
                            color: FlutterFlowTheme.tertiaryColor,
                            unreadColor: FlutterFlowTheme.secondaryColor,
                            titleTextStyle: GoogleFonts.getFont(
                              'Lexend Deca',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            dateTextStyle: GoogleFonts.getFont(
                              'Lexend Deca',
                              color: FlutterFlowTheme.grayIcon400,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            previewTextStyle: GoogleFonts.getFont(
                              'Lexend Deca',
                              color: FlutterFlowTheme.grayIcon,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(12, 3, 12, 3),
                            borderRadius: BorderRadius.circular(0),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
