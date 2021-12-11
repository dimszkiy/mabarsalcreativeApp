import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SALcreativeFirebaseUser {
  SALcreativeFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SALcreativeFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SALcreativeFirebaseUser> sALcreativeFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<SALcreativeFirebaseUser>(
        (user) => currentUser = SALcreativeFirebaseUser(user));
