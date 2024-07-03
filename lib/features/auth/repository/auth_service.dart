import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthypet/features/auth/repository/user_data_service.dart';
import 'package:riverpod/riverpod.dart';

final authServiceProvider = Provider((ref) =>
    AuthService(auth: FirebaseAuth.instance, googleSignIn: GoogleSignIn()));

class AuthService with ChangeNotifier{
  FirebaseAuth auth;
  GoogleSignIn googleSignIn;
  AuthService({
    required this.auth,
    required this.googleSignIn
  });

  signInWithGoogle() async {
    final user = await googleSignIn.signIn();
    final googleAuth = await user!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    await auth.signInWithCredential(credential).then((value){
      UserDataService userDataService = UserDataService(auth: auth, firestore: FirebaseFirestore.instance);
      userDataService.addUserDataToFirestore(
          displayName: auth.currentUser!.displayName!,
          email: auth.currentUser!.email!,
          profilePic: auth.currentUser!.photoURL!,
          userId: auth.currentUser!.uid);

    });

    notifyListeners();
  }

  Future<bool> isUserLoggedIn() async {
    return auth.currentUser == null ? false : true;
  }



}