import 'package:dio/dio.dart'as DIO;
import 'package:get/get.dart';
import 'package:mie_ride/network/urls.dart';

class ApiService extends GetxService {
  DIO.Dio dioClient = DIO.Dio();
  final int timeoutInSeconds = 30;
  final DIO.LogInterceptor loggingInterceptor = DIO.LogInterceptor();

  Future<DIO.Response> postData(String url, Map<String, dynamic> body) async {
    DIO.FormData formData = DIO.FormData.fromMap(body) ;
    return await dioClient.post(URLS.BASE_URL + url, data: formData).timeout(Duration(seconds: timeoutInSeconds));
  }

  Future<DIO.Response> getData(String url) async {
    return await dioClient.get(URLS.BASE_URL + url).timeout(Duration(seconds: timeoutInSeconds));
  }
}