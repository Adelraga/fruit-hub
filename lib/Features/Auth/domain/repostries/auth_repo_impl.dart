import 'package:dartz/dartz.dart';
import 'package:fruit_market_app/Features/Auth/data/models/user_model.dart';

import 'package:fruit_market_app/core/errors/exceptions.dart';

import '../../../../core/widgets/Error_widget.dart';
import 'auth_repo.dart';
import 'firebase_auth_service.dart';

class AuthRepoImpi extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpi(this.firebaseAuthService);


  @override
  Future<Either<CustomFailure, UserModel>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.loginWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(CustomFailure(message: e.message));  // Handle CustomException properly
    }
  }

  @override
  Future<Either<CustomFailure, UserModel>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.loginWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(CustomFailure(message: e.message));  // Handle CustomException properly
    }
  }
  @override
Future<Either<CustomFailure, UserModel>> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user!));
    } on CustomException catch (e) {
      return Left(CustomFailure(message: e.message));  // Handle CustomException properly
    }
  }
  
  @override
  Future<Either<CustomFailure, UserModel>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user!));
    } on CustomException catch (e) {
      return Left(CustomFailure(message: e.message));  // Handle CustomException properly
    }
  }

}
