
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

void Showsnackbar( String message) {
   Get.rawSnackbar(
          messageText:Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14
            )
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED
        );
  }