import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Auth/data/models/user_model.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/Login-Form/view/login-form.dart';
import 'package:fruit_market_app/core/errors/failures.dart';

import '../../../../core/widgets/Error_widget.dart';

abstract class AuthRepo
{
  Future <Either<CustomFailure, UserModel>> signInWithFacebook();
  Future <Either<CustomFailure, UserModel>> signInWithGoogle();
  Future <Either<CustomFailure,UserModel>> createUserWithEmailAndPassword(String email, String password);
  Future <Either<CustomFailure,UserModel>> signInWithEmailAndPassword(String email, String password);
}

// class AuthRepoImpi implements AuthRepo
// {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


//   @override
//   Future<Either<Exception, UserCredential>> loginWithFacebook() async {
//     try {
//       final LoginResult loginResult = await FacebookAuth.instance.login();

//       // Create a credential from the access token
//       final OAuthCredential facebookAuthCredential =
//           FacebookAuthProvider.credential(loginResult.accessToken!.token);

//       // Once signed in, return the UserCredential
//       return Right(await _firebaseAuth.signInWithCredential(facebookAuthCredential));
//     } catch (e) {
//       return Left(Exception('Errorrrr'));
//     }
//   }

//   @override
//   Future<Either<Exception, UserCredential>> loginWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       // Obtain the auth details from the request
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;

//       // Create a new credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       // Once signed in, return the UserCredential
//       return Right(await _firebaseAuth.signInWithCredential(credential));
//     } catch (e) {
//       return Left(Exception('error'));
//     }
//   }

//   @override
//   Future completeInformation({required String name, required String phoneNumber, required String address}) {
//     // TODO: implement completeInformation
//     throw UnimplementedError();
//   }
