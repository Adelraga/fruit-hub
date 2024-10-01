import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/errors/exceptions.dart';

class FirebaseAuthService {



Future<User> loginWithFacebook() async {
 
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return( await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)).user!;
   
  }

  @override
  Future<User> loginWithGoogle() async {
    
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return (
          await FirebaseAuth.instance.signInWithCredential(credential)).user!;
    
  }


















  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return result.user;  // Handle null user scenario if necessary
    } on FirebaseAuthException catch (e) {
      // Check for different error codes and throw a CustomException
      if (e.code == 'weak-password') {
        throw CustomException(message: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: "The account already exists for that email");
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: "The email provided is not valid");
      } else {
        throw CustomException(message: "Something went wrong");
      }
    } catch (e) {
      // Catch other potential exceptions
      throw CustomException(message: "Something went wrong");
    }
  }
  
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return result.user;  // Handle null user scenario if necessary
    } on FirebaseAuthException catch (e) {
      // Check for different error codes and throw a CustomException
      if (e.code == 'user-not-found') {
        throw CustomException(message: "No user found for that email");
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: "Wrong password provided for that user");
      } else {
        throw CustomException(message: "Something went wrong");
      }
    } catch (e) {
      // Catch other potential exceptions
      log(
        e.toString(),
      );
      throw CustomException(message: "Something went wrong");
    }
  }
}
