import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mie Ride',
     debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.getSplashScreenRoute(),
     getPages: RouteHelper.routes,
    );
  }
}

