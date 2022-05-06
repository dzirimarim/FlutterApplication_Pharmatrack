import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PharmaTrackFirebaseUser {
  PharmaTrackFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

PharmaTrackFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PharmaTrackFirebaseUser> pharmaTrackFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<PharmaTrackFirebaseUser>(
        (user) => currentUser = PharmaTrackFirebaseUser(user));
