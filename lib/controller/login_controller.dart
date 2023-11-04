

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
  var deleteLoading = false.obs;

  ApiService apiService = ApiService();
  SharedPreferenceMie sp = SharedPreferenceMie();


  void Login(BuildContext context, String contact,String password)async{
    isLoading.value = true;
    Map<String,dynamic> parameter = {
      "contact"  : contact,
      "password" : password,
    };
    log('login parameter------>$parameter');
    try{

      final response = await apiService.postData(URLS.ADMIN_LOGIN, parameter);
      var jsonString = jsonDecode(response.data);
      log("login response -----:>$jsonString");
      var result = jsonString['result'];
      var id = jsonString['id'];
      if(result == "success"){
        isLoading.value = false;
        log("id ----$id");
        showCustomSnackBar("Login Successfully", context);
        sp.setStringValue(sp.USER_ID, id);
        sp.setBoolValue(sp.LOGIN_KEY, true);
        Get.offNamed(RouteHelper.getHomePageScreenRoute());
      }else{
        showCustomSnackBar("something went wrong", context);
        isLoading.value = false;
      }
    }catch(e){
      isLoading.value = false;
      showCustomSnackBar("something went wrong", context);
      log("Exception --->: ",error: e.toString());
    }

  }

  void deleteAccount(BuildContext context)async{
    log(await sp.getStringValue(sp.USER_ID).toString());
    deleteLoading.value = true;
    Map<String, dynamic> map = {
      'admin_id' : await sp.getStringValue(sp.USER_ID),
    };

    log("is-----$map");
    try{

      final response = await apiService.postData(URLS.DELETE_ACCOUNT, map);

      var jsonString  = jsonDecode(response.data);

      if(jsonString['result'] == "success"){
        deleteLoading.value = false;
        showCustomSnackBar("Account deleted", context);
        Get.offAllNamed(RouteHelper.getLoginScreenRoute());
      }else{
        deleteLoading.value = false;
        showCustomSnackBar("something went wrong", context);
      }

    }catch(e){
      deleteLoading.value = false;
      showCustomSnackBar("something went wrong", context);
    }

  }


}