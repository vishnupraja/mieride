import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  SharedPreferenceMie sp = SharedPreferenceMie();
  
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage("assets/images/img_1.png"),fit: BoxFit.cover)
        )));
  }
  
  void getData()async{
    log("Login Key ------->: ${await sp.getBoolValue(sp.LOGIN_KEY)}");
    if(await sp.getBoolValue(sp.LOGIN_KEY) != true){
      Timer(Duration(seconds: 3), () {
        Get.offNamed(RouteHelper.getLoginScreenRoute());
      });
    }else{
     Timer(Duration(seconds: 2), (){
       Get.offNamed(RouteHelper.getHomePageScreenRoute());
     });
    }
  }
  
}
