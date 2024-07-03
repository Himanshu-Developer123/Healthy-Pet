import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthypet/features/auth/model/user_model.dart';
import 'package:riverpod/riverpod.dart';

final userDataServiceProvider = Provider((ref) => UserDataService(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance));


class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  UserDataService({
    required this.auth,
    required this.firestore
  });

  addUserDataToFirestore({
    required String displayName,
    required String email,
    required String profilePic,
    required String userId
}) async {
    UserModel user = UserModel(
        userId: auth.currentUser!.uid,
        email: email ?? '',
        displayName: displayName ?? '',
        profilePic: profilePic ?? ''
    );

    await firestore.collection('users').doc(auth.currentUser!.uid).set(user.toJson(user));
  }
}