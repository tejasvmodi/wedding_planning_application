import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackkBar({message, title = '', icon = const Icon(Icons.done)}) {
  Get.snackbar(
    message,
    title,
    snackPosition: SnackPosition.BOTTOM,
    icon: icon,
  );
}