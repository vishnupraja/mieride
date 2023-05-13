

import 'dart:developer';

import 'package:get/get.dart';
import 'package:mie_ride/models/admin_booking_list_model.dart';
import 'package:mie_ride/network/api_service.dart';
import 'package:mie_ride/network/urls.dart';

class BookingController extends GetxController{

  var isLoading = false.obs;

  ApiService apiService = ApiService();

  var bookingList = <AdminBookingListModel>[].obs;

  void bookingManagement(String status)async{
    isLoading.value = true;
    Map<String,dynamic> parameter = {
      "status"   : status,
    };
    log("booking parameter ---->:$parameter");

    try{

      final response = await apiService.postData(URLS.FETCH_ADMIN_BOOKING_LIST, parameter);

      log('Booking List Response ----->:${response.data}');

      bookingList.value = adminBookingListModelFromJson(response.data);

      isLoading.value = false;

    }catch(e){
      isLoading.value = false;
      log("Exception ----->:  ",error: e.toString());
    }

  }
}