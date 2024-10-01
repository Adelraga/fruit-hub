import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/Login-Form/view/login-form.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/login/view/Login-View.dart';
import 'package:get/get.dart';

import '../../../../../../../core/widgets/btm_bar.dart';

class IHaveAccount extends StatelessWidget {
  const IHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    ' تمتلك حساب بالفعل ?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 98, 98, 98)),
                  ),
                  TextButton(
                    onPressed: () {
                    
                 Get.to(() => LoginView(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 500),
                    );
           
                    },
                    child: const Text(
                      'تسجيل دخول',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              );
  }
}