import 'package:get/get.dart';
import 'package:mie_ride/view/authentication/login_Screen.dart';
import 'package:mie_ride/view/authentication/splace_screen.dart';
import 'package:mie_ride/view/home_view/add_city/add_city.dart';
import 'package:mie_ride/view/home_view/surge_pricing/surge_pricing.dart';
import '../view/home_view/add_city/add_city_field.dart';
import '../view/home_view/add_coin/view_user.dart';
import '../view/home_view/booking/cancel_order.dart';
import '../view/home_view/booking/complete_order.dart';
import '../view/home_view/booking/confirm_order.dart';
import '../view/home_view/booking/order_allote.dart';
import '../view/home_view/booking/place_order.dart';
import '../view/home_view/booking/booking_details.dart';
import '../view/home_view/home_screen.dart';
import '../view/home_view/rate_managment/add_rate.dart';
import '../view/home_view/rate_managment/rate_manage.dart';
import '../view/home_view/ride_assignment/driver_list.dart';
import '../view/home_view/ride_assignment/ride_assignment.dart';
import '../view/home_view/surge_pricing/surge_price_add.dart';

class RouteHelper{

  static const String initial = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String bookingdetail = '/bookingdetail';
  static const String placeorder = '/placeorder';
  static const String cancelorder = '/cancelorder';
  static const String completeorder = '/completeorder';
  static const String allotorder = '/allotorder';
  static const String confirmorder = '/confirmorder';
  static const String viewuser = '/viewuser';
  static const String rideassignment = '/rideassignment';
  static const String driver = '/driver';
  static const String rateManage = '/rateManage';
  static const String addRate = '/addRate';
  static const String surgePrice = '/surgePrice';
  static const String addCity = '/addCity';
  static const String addCityField = '/addCityField';
  static const String surgePriceAdd = '/surgePriceAdd';



  static String getInitialRoute()=>initial;
  static getSplashScreenRoute()=>splash;
  static getLoginScreenRoute()=>login;
  static getHomePageScreenRoute()=>home;
  static getBookingDetailScreenRoute()=>bookingdetail;
  static getPlaceOrderScreenRoute()=>placeorder;
  static getCancelOrderScreenRoute()=>cancelorder;
  static getCompleteOrderScreenRoute()=>completeorder;
  static getOrderAllotScreenRoute()=>allotorder;
  static getConfirmOrderScreenRoute()=>confirmorder;
  static getViewUserScreenRoute()=>viewuser;
  static getRideAssignmentScreenRoute()=>rideassignment;
  static getDriverScreenRoute()=>driver;
  static getRateManagementScreenRoute()=>rateManage;
  static getAddRateManagementScreenRoute()=>addRate;
  static getSurgePriceScreenRoute()=>surgePrice;
  static getAddCityScreenRoute()=>addCity;
  static getAddCityFieldScreenRoute()=>addCityField;
  static getSurgePriceAddScreenRoute()=>surgePriceAdd;




  static  List<GetPage> routes = [

    GetPage(name: splash, page: ()=> const SplashScreen()),
    GetPage(name: login, page: ()=> const LoginScreen()),
    GetPage(name: home, page: ()=> const HomePage()),
    GetPage(name: bookingdetail, page: ()=> const BookingDetail()),
    GetPage(name: placeorder, page: ()=> const PlaceOrder()),
    GetPage(name: cancelorder, page: ()=> const CancelOrder()),
    GetPage(name: completeorder, page: ()=> const CompleteOrder()),
    GetPage(name: allotorder, page: ()=> const OrderAllot()),
    GetPage(name: confirmorder, page: ()=> const ConfirmOrder()),
    GetPage(name: viewuser, page: ()=> const ViewUser()),
    GetPage(name: rideassignment, page: ()=> const RideAssignment()),
    GetPage(name: driver, page: ()=> const Driver()),
    GetPage(name: rateManage, page: ()=> const RateManagement()),
    GetPage(name: addRate, page: ()=> const AddRateManagement()),
    GetPage(name: surgePrice, page: ()=> const SurgePrice()),
    GetPage(name: addCity, page: ()=> const AddCity()),
    GetPage(name: addCityField, page: ()=> const AddCityField()),
    GetPage(name: surgePriceAdd, page: ()=> const SurgePriceAdd()),


  ];


}
