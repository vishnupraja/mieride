import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mie_ride/models/admin_booking_list_model.dart';
import 'package:mie_ride/models/admin_fetch_driver_model.dart';
import 'package:mie_ride/network/api_service.dart';
import 'package:mie_ride/network/urls.dart';
import 'package:mie_ride/utils/SnackBar.dart';

class BookingController extends GetxController{

  var isLoading = false.obs;
  var confirmLoading = false.obs;
  var cancelLoading = false.obs;
  var driverLoading = false.obs;
  var fetchDriverLoading = false.obs;


  var currentIndex = 0.obs;

  ApiService apiService = ApiService();

  var bookingList = <AdminBookingListModel>[].obs;
  var driverList = <AdminFetchDriverModel>[].obs;

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

  void allotDriver(BuildContext context,String bookingId,String driverId,VoidCallback callback)async{
    driverLoading.value = true;
    Map<String, dynamic> driveParameter ={
      "booking_id"   : bookingId,
      "driver_id"    : driverId,
    };
    log("driver allot parameter ------->:$driveParameter");

    try{
      final response = await apiService.postData(URLS.ADMIN_ALLOT_DRIVER, driveParameter);

      var jsonString = jsonDecode(response.data);
      log("driver response ----->:$jsonString");
      var result = jsonString['result'];
      if(result == "success"){
        driverLoading.value = false;
        showCustomSnackBar("Driver Alloted", context);
        callback();
      }else{
        driverLoading.value = false;
      }

    }catch(e){
      driverLoading.value = false;
      log("Exception -----",error: e.toString());
    }
  }

  void fetchDriver()async{
    fetchDriverLoading.value = true;
    try{
      final response = await apiService.getData(URLS.ADMIN_FETCH_DRIVER);
      log("fetch driver response ------>:${response.data}");
      driverList.value  = adminFetchDriverModelFromJson(response.data);
      fetchDriverLoading.value = false;
    }catch(e){
      fetchDriverLoading.value = false;
      log("Exception -----",error: e.toString());
    }
  }

}