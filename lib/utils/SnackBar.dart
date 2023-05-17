import 'package:flutter/material.dart';
import 'colors.dart';

void showCustomSnackBar(String message, BuildContext context,) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.horizontal,
      margin: const EdgeInsets.all(10.0),
      duration: const Duration(milliseconds: 1500),
      backgroundColor: MyColors.secondry,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Text(message, style:const TextStyle(color: Colors.white)),
    ));

}