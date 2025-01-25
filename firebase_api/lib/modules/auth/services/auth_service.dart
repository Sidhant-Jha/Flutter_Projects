import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService {

final _googleSignIn = GoogleSignIn();
final _firebaseAuth = FirebaseAuth.instance;

Future<User?> getUser() async
{
  return _firebaseAuth.currentUser;
}

Future<void> logoutUser() async
{
  await _googleSignIn.signOut();
  await _firebaseAuth.signOut();
}

Future<User?> signInWithGoogle() async {

  final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

 final UserCredential =  await _firebaseAuth.signInWithCredential(credential);
  return UserCredential.user;

}

}