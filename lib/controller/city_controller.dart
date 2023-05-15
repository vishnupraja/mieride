

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ride/network/api_service.dart';
import 'package:mie_ride/utils/SnackBar.dart';

import '../network/urls.dart';

class CityController extends GetxController{

  RxString longitude = ''.obs;
  RxString latitude = ''.obs;

  var isLoading = false.obs;

  ApiService apiService = ApiService();

  Future<void> adminAddCity(BuildContext context,String cityName,) async {
    isLoading.value = true;
    Map<String,dynamic> addCityParameter = {
      'city_name'  : cityName,
      'latitude'  : latitude.value,
      'longitude' : longitude.value,
    };
    log("addCity parameter ---->:$addCityParameter");

    try{

      final response = await apiService.postData(URLS.ADMIN_ADD_CITY, addCityParameter);

      var jsonString = jsonDecode(response.data);
      log("addCity response ----->:$jsonString");
      var result = jsonString['result'];
      if(result == "success"){
        isLoading.value = false;
        showCustomSnackBar("City Added", context);
        Get.back();
      }else{
        isLoading.value = false;
        showCustomSnackBar("something went wrong", context);
      }

    }catch(e){
      isLoading.value = false;
      log("Exception ------:>",error: e.toString());
    }
  }

}