

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ride/network/api_service.dart';
import 'package:mie_ride/utils/SnackBar.dart';
import 'package:mie_ride/utils/shared_preferences.dart';

import '../network/urls.dart';
import '../rout_helper/rout_helper.dart';

class LoginController extends GetxController{

  var isLoading = false.obs;

  ApiService apiService = ApiService();
  SharedPreferenceMie sp = SharedPreferenceMie();


  void Login(BuildContext context, String contact,String password)async{
    isLoading.value = true;
    Map<String,dynamic> parameter = {
      "contact"  : contact,
      "password" : password,
    };
    try{

      final response = await apiService.postData(URLS.ADMIN_LOGIN, parameter);
      var jsonString = jsonDecode(response.data);
      log("login response -----:>$jsonString");
      var result = jsonString['result'];
      if(result == "success"){
        isLoading.value = false;
        showCustomSnackBar("Login Successfully", context);
        sp.setBoolValue(sp.LOGIN_KEY, true);
        Get.offNamed(RouteHelper.getHomePageScreenRoute());
      }else{
        isLoading.value = false;
      }
    }catch(e){
      isLoading.value = false;
      log("Exception --->: ",error: e.toString());
    }

  }

}