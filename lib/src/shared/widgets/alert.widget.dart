import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class Alert {
  static void error({String title = "Deu ruim", required String msg}) {
    Get.snackbar(
      title,
      msg,
      backgroundColor: ColorsPallet.red500,
      colorText: ColorsPallet.light0,
      icon: const Icon(Icons.error, color: ColorsPallet.light0),
    );
  }

  static void success({String title = "Sucesso", required String msg}) {
    Get.snackbar(
      title,
      msg,
      backgroundColor: ColorsPallet.green500,
      colorText: ColorsPallet.light0,
      icon: const Icon(Icons.check, color: ColorsPallet.light0),
    );
  }
}
