import 'package:bloc/bloc.dart';
import 'package:fruit_market_app/Features/Auth/data/models/user_model.dart';
import 'package:fruit_market_app/Features/Auth/domain/repostries/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;

  SignupCubit(this.authRepo) : super(SignupInitial());

   Future<void> signUp(String email, String password) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(email, password);
    
    result.fold(
      (failure) => emit(SignupFailure(failure.message)), // Handle failure
      (user) => emit(SignupSuccess(user)),               // Handle success
    );
  }
}
