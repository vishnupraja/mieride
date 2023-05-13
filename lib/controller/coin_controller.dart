

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mie_ride/models/admin_user_list_model.dart';
import 'package:mie_ride/network/api_service.dart';
import 'package:mie_ride/utils/SnackBar.dart';

import '../network/urls.dart';

class CoinController extends GetxController{

  var isLoading = false.obs;
  var coinLoading = false.obs;

  ApiService apiService = ApiService();

  var userList = <AdminUserListModel>[].obs;

  void userFetch()async{
    isLoading.value = true;

   try{

     final response = await apiService.getData(URLS.FETCH_ADMIN_USER_LIST,);

     log("userList response ------>:${response.data}");

     userList.value = adminUserListModelFromJson(response.data);

     isLoading.value = false;

   }catch(e){
     isLoading.value = false;
     log("Exception ------",error: e.toString());
   }

  }

  void addCoin(BuildContext context,String id,String Coin)async{
    coinLoading.value = true;
    Map<String,dynamic> parameter = {
      'user_id'   : id,
      'coins'     : Coin,
    };
    log("parameter ------>:$parameter");

    try{

      final response  = await apiService.postData(URLS.ADD_USER_COIN, parameter);

      var jsonString = jsonDecode(response.data);

      log("coinAdd response -------->:$jsonString");

      var result = jsonString['result'];

      if(result == "success"){
        userFetch();
        coinLoading.value = false;
        Get.back();
        showCustomSnackBar('Coin Added', context);
      }
    }catch(e){
      coinLoading.value = false;
      log("Exception ---",error: e.toString());
    }
  }

}