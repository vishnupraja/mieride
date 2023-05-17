

import 'dart:developer';

import 'package:get/get.dart';
import 'package:mie_ride/models/surge_price_model.dart';
import 'package:mie_ride/network/api_service.dart';

import '../network/urls.dart';

class SurgePriceController extends GetxController {
  
  var isLoading = false.obs;
  
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
  
  
}