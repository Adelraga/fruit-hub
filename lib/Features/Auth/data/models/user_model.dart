import 'package:firebase_auth/firebase_auth.dart';

class UserModel {

  final String email;

  final String uid;
  UserModel({ required this.email, required this.uid});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        email: user.email!, uid: user.uid);
  }
}
