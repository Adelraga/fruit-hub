import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:fruit_market_app/Features/Auth/presentation/cubits/signin_cubit/sign_in_cubit.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/Login-Form/view/login-form.dart';
import 'package:fruit_market_app/core/consts/constant.dart';
import 'package:fruit_market_app/core/utils/size-ONFIG.dart';
import 'package:fruit_market_app/core/widgets/Custom-Button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/widgets/btm_bar.dart';
import '../../../Login-Form/view/widget/custom-text-form-field.dart';
import 'custom_divider.dart';
import 'do_you_have_account.dart';
import 'social_media_container.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
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
                  text: 'تسجيل دخول',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<SignInCubit>().signIn(
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
                DoYouHaveAccount(),
                SizedBox(height: SizeConfig.defaultSize! * 2),
                CustomDivider(),
                SizedBox(height: SizeConfig.defaultSize! * 6),
                SocialMediaContainer(
                  icon: FontAwesomeIcons.google,
                  text: 'تسجيل الدخول بواسطة جوجل',
                  onTap: () {
                    context.read<SignInCubit>().signInWithGoogle();
                  },
                ),
                // SizedBox(height: SizeConfig.defaultSize! * 2),
                // SocialMediaContainer(
                //   icon: FontAwesomeIcons.apple,
                //   text: 'تسجيل الدخول بواسطة ابل',
                // ),
                SizedBox(height: SizeConfig.defaultSize! * 2),
                SocialMediaContainer(
                  icon: FontAwesomeIcons.facebookF,
                  text: 'تسجيل الدخول باستخدام فيسبوك',
                  onTap: () {
                    context.read<SignInCubit>().signInWithFacebook();
                  },
                )
              ],
            ),
          ),
        ));
  }
}
