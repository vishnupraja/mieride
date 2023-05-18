import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ride/models/surge_price_model.dart';
import 'package:mie_ride/network/api_service.dart';
import 'package:mie_ride/utils/SnackBar.dart';
import '../network/urls.dart';

class SurgePriceController extends GetxController {
  
  var isLoading = false.obs;
  var isLoadings = false.obs;

  ApiService apiService = ApiService();

  var surgeList = <SurgePriceModel>[].obs;
  
  void fetchSurgePrice()async{
    isLoading.value = true;
    
    try{
      
      final response = await apiService.getData(URLS.ADMIN_SURGE_PRICING);

      log("surge price response ------->:${response.data}");

      surgeList.value = surgePriceModelFromJson(response.data);

      isLoading.value = false;
      
    }catch(e){
      isLoading.value = false;
      log("Exception ---->: ",error: e.toString());
    }
    
  }

  void surgeAddPrice(BuildContext context,String name, String price,String time)async{
    isLoadings.value = true;
    Map<String,dynamic> map = {
      'surge_name'    : name,
      'surge_price'   : price,
      'surge_time'    : time
    };
    log("parameter add ------>:$map");
    try{

      final response = await apiService.postData(URLS.ADMIN_SURGE_PRICING_ADD, map);
      var jsonString = jsonDecode(response.data);
      log("response ----->:$jsonString}");
      var result = jsonString['result'];
      if(result == "success"){
        isLoadings.value  = false;
        fetchSurgePrice();
        Get.back();
        showCustomSnackBar("Pricing Added", context);
      }else{
        isLoadings.value  = false;
        showCustomSnackBar(result.toString(), context);
      }

    }catch(e){
      isLoadings.value  = false;
      log("Exception ----->: ",error: e.toString());
    }
  }
  
  
}