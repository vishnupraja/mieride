import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:mie_ride/models/admin_booking_list_model.dart';
import 'package:mie_ride/network/api_service.dart';
import 'package:mie_ride/network/urls.dart';

class BookingController extends GetxController{

  var isLoading = false.obs;
  var confirmLoading = false.obs;
  var cancelLoading = false.obs;


  var currentIndex = 0.obs;

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

  void confirmBooking(String bookingId,VoidCallback callback)async{
    confirmLoading.value = true;
    Map<String,dynamic> parameter = {
      'booking_id'  : bookingId,
    };
    log('parameter ----->:$parameter');

    try{

      final response = await apiService.postData(URLS.ADMIN_CONFIRM_BOOKING, parameter);

      var jsonString = jsonDecode(response.data);

      log('confirm booking response -----:>$jsonString');

      var result  = jsonString['result'];

      if(result == "success"){
        confirmLoading.value = false;
        callback();
      }else{
        confirmLoading.value = false;
      }

    }catch(e){
      confirmLoading.value = false;
      log('Exception -----:>',error: e.toString());
    }

  }

  void cancelBooking(String bookingId,VoidCallback callback)async{
    cancelLoading.value = true;
    Map<String,dynamic> parameter = {
      'booking_id'  : bookingId,
    };
    log('parameter ----->:$parameter');

    try{

      final response = await apiService.postData(URLS.ADMIN_CANCEL_BOOKING, parameter);

      var jsonString = jsonDecode(response.data);

      log('cancel booking response -----:>$jsonString');

      var result  = jsonString['result'];

      if(result == "success"){
        cancelLoading.value = false;
        callback();
      }else{
        cancelLoading.value = false;
      }

    }catch(e){
      cancelLoading.value = false;
      log('Exception -----:>',error: e.toString());
    }

  }

}