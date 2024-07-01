import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

void snackMessage(msg) {
  Get.snackbar("Alert",
  msg,
  snackPosition:SnackPosition.BOTTOM,
  margin:EdgeInsets.all(16)
  );
}
