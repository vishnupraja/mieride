
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ride/models/rate_manage_city_fetch_model.dart';
import 'package:mie_ride/network/api_service.dart';
import 'package:mie_ride/utils/SnackBar.dart';

import '../network/urls.dart';

class RideManagementController extends GetxController{

  var isLoading = false.obs;
  var isLoadings = false.obs;

  ApiService apiService = ApiService();

  var rateList = <AdminRateManageCityPriceModel>[].obs;

  void adminAddCityPrice(BuildContext context,String city1Id,String city2Id,String sharePrice,String privatePrice)async{
    isLoading.value = true;
    Map<String,dynamic> addParameter = {
      'city1_id'           :city1Id,
      'city2_id'           : city2Id,
      'ride_share_ride'    : sharePrice,
      'ride_private_price' : privatePrice,
    };
    log("addParameter ------->:$addParameter");

    try{

      final response = await apiService.postData(URLS.ADMIN_ADD_CITY_PRICE, addParameter);
      var jsonString = jsonDecode(response.data);
      log("response ------>:$jsonString");
      var result  = jsonString['result'];
      if(result == "success"){
        isLoading.value = false;
        showCustomSnackBar("Price Added", context);
        adminCityPriceFetch();
        Get.back();
      }else{
        isLoading.value = false;
        showCustomSnackBar(result.toString(), context);
      }
    }catch(e){
      isLoading.value = false;
      log("Exception ------->: ",error: e.toString());
    }
  }

  void adminCityPriceFetch()async{
    isLoadings.value = true;
    try{
      
      final response = await apiService.getData(URLS.ADMIN_FETCH_CITY_PRICE);

      log("fetch city price response ------->:${response.data}");

      rateList.value = adminRateManageCityPriceModelFromJson(response.data);
      isLoadings.value = false;
      
    }catch(E){
      isLoadings.value = false;
      log("Exception ----->: ",error:  E.toString());
    }
  }


}