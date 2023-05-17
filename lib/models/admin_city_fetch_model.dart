
// To parse this JSON data, do
//
//     final adminFetchCityModel = adminFetchCityModelFromJson(jsonString);

import 'dart:convert';

List<AdminFetchCityModel> adminFetchCityModelFromJson(String str) => List<AdminFetchCityModel>.from(json.decode(str).map((x) => AdminFetchCityModel.fromJson(x)));

String adminFetchCityModelToJson(List<AdminFetchCityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminFetchCityModel {
  String cityId;
  String cityName;
  String latitude;
  String longitude;
  String status;

  AdminFetchCityModel({
    required this.cityId,
    required this.cityName,
    required this.latitude,
    required this.longitude,
    required this.status,
  });

  factory AdminFetchCityModel.fromJson(Map<String, dynamic> json) => AdminFetchCityModel(
    cityId: json["city_id"],
    cityName: json["city_name"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "city_name": cityName,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
  };
}
