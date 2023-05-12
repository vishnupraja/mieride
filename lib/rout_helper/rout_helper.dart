import 'package:get/get.dart';
import 'package:mie_ride/view/authentication/login_Screen.dart';
import 'package:mie_ride/view/authentication/splace_screen.dart';
import '../view/home_view/add_coin/view_user.dart';
import '../view/home_view/booking/cancel_order.dart';
import '../view/home_view/booking/complete_order.dart';
import '../view/home_view/booking/confirm_order.dart';
import '../view/home_view/booking/order_allote.dart';
import '../view/home_view/booking/place_order.dart';
import '../view/home_view/booking/booking_details.dart';
import '../view/home_view/home_screen.dart';

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


  ];


}
