import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.offNamed(RouteHelper.getLoginScreenRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      'assets/images/SplashImage.png',
      height: context.height,
      width: context.width,
      fit: BoxFit.fill,
    ));
  }
}
