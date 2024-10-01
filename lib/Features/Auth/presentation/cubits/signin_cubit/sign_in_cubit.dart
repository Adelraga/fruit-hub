import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_model.dart';
import '../../../domain/repostries/auth_repo.dart';

part 'sign_in_state.dart';



class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;

  SignInCubit(this.authRepo) : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    
    result.fold(
      (failure) => emit(SignInFailure(failure.message)), // Handle failure
      (user) => emit(SignInSuccess(user)),               // Handle success
    );
  }
  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    
    result.fold(
      (failure) => emit(SignInFailure(failure.message)), // Handle failure
      (user) => emit(SignInSuccess(user)),               // Handle success
    );
  }
  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithFacebook();
    
    result.fold(
      (failure) => emit(SignInFailure(failure.message)), // Handle failure
      (user) => emit(SignInSuccess(user)),               // Handle success
    );
  }

}


