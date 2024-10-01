import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/Login-Form/view/login-form.dart';
import 'package:get/get.dart';

import '../../../../../../../core/widgets/btm_bar.dart';

class DoYouHaveAccount extends StatelessWidget {
  const DoYouHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ليس لديك حساب؟',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 98, 98, 98)),
                  ),
                  TextButton(
                    onPressed: () {
                    
                 Get.to(() => CompleteInformationView(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 500),
                    );
           
                    },
                    child: const Text(
                      'انشاء حساب',
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