// To parse this JSON data, do
//
//     final adminFetchCityModel = adminFetchCityModelFromJson(jsonString);

import 'dart:convert';

List<AdminFetchCityModel> adminFetchCityModelFromJson(String str) => List<AdminFetchCityModel>.from(json.decode(str).map((x) => AdminFetchCityModel.fromJson(x)));

String adminFetchCityModelToJson(List<AdminFetchCityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminFetchCityModel {
  String cityId;
  String cityName;
  String cityAddress;
  String latitude;
  String longitude;
  String status;

  AdminFetchCityModel({
    required this.cityId,
    required this.cityName,
    required this.cityAddress,
    required this.latitude,
    required this.longitude,
    required this.status,
  });

  factory AdminFetchCityModel.fromJson(Map<String, dynamic> json) => AdminFetchCityModel(
    cityId: json["city_id"],
    cityName: json["city_name"],
    cityAddress: json["city_address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "city_name": cityName,
    "city_address": cityAddress,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
  };
}
