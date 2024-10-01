import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/Features/Auth/domain/repostries/auth_repo.dart';
import 'package:fruit_market_app/Features/Auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/Login-Form/view/widget/CompleteInformationViewBody.dart';
import 'package:fruit_market_app/core/DI/dependency_injection.dart';
import 'package:fruit_market_app/core/widgets/btm_bar.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CompleteInformationView extends StatelessWidget {
  const CompleteInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            // leading: IconButton(

            //   icon: Icon(Icons.arrow_back), onPressed: () {  },
            // ),
            title: Text("حساب جدبد")),
        body: Builder(
          builder: (BuildContext context) {
            return SignUpViewBlocConsumer();
          },
        ),
      ),
    );
  }
}

class SignUpViewBlocConsumer extends StatelessWidget {
  const SignUpViewBlocConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          // Navigate to the next page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Account created successfully ✅, Please SignIn! "),  // Display the error message
            ),
          );
        } else if (state is SignupFailure) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure),  // Display the error message
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading,  // Show loading indicator
          child: CompleteInformationViewBody(),
        );
      },
    );
  }
}

