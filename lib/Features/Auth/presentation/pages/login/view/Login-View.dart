import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/Features/Auth/presentation/cubits/signin_cubit/sign_in_cubit.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/login/view/widget/login-view-body.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/DI/dependency_injection.dart';
import '../../../../../../core/widgets/btm_bar.dart';
import '../../../../domain/repostries/auth_repo.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SignInCubit(
          getIt<AuthRepo>(),
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            title: Text('تسجيل الدخول'),
          ),
          body: signInBlocConsumer(),
        ),
      ),
    );
  }
}

class signInBlocConsumer extends StatelessWidget {
  const signInBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is SignInSuccess) {
          // Navigate to the next page
          Get.to(() => const BottomBarWidget());
        } else if (state is SignInFailure) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message), // Display the error message
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignInLoading ? true : false,
          child: LoginViewBody());
      },
    );
  }
}
