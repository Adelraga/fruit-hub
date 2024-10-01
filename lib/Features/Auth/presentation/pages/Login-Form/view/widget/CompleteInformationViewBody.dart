import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/Login-Form/view/widget/custom-text-form-field.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/Login-Form/view/widget/form-title.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/login/view/Login-View.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/Home_page.dart';
import 'package:fruit_market_app/core/utils/size-ONFIG.dart';
import 'package:fruit_market_app/core/widgets/Custom-Button.dart';
import 'package:fruit_market_app/core/widgets/btm_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../cubits/signup_cubit/signup_cubit.dart';
import 'i_have_account.dart';

class CompleteInformationViewBody extends StatefulWidget {
  const CompleteInformationViewBody({super.key});

  @override
  State<CompleteInformationViewBody> createState() =>
      _CompleteInformationViewBodyState();
}

class _CompleteInformationViewBodyState
    extends State<CompleteInformationViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email, userName, password;
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  // final _nameController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 4,
          left: 16,
          right: 16,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.defaultSize! * 5),
                CustomTextFormField(
                  onSaved: (value) {
                    userName = value ?? "emam";
                  },
                  inputType: TextInputType.text,
                  title: 'الاسم كامل',
                ),
                SizedBox(height: SizeConfig.defaultSize! * 3),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value ?? "emam";
                  },
                  inputType: TextInputType.text,
                  title: 'البريد الالكترونى',
                ),
                SizedBox(height: SizeConfig.defaultSize! * 2),
                CustomTextFormField(
                  onSaved: (value) {
                    password = value ?? "emam";
                  },
                  inputType: TextInputType.text,
                  title: 'كلمة المرور',
                  isPassword: true, // Set this to true for the password field
                ),
                SizedBox(height: SizeConfig.defaultSize! * 3),
                CustomGeneralButton(
                  text: "انشاء حساب جديد",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<SignupCubit>().signUp(
                            email,
                            password,
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                SizedBox(height: SizeConfig.defaultSize! * 3),
                IHaveAccount()
              ],
            ),
          ),
        ));
  }
}
