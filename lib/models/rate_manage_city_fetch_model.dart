
// To parse this JSON data, do
//
//     final adminRateManageCityPriceModel = adminRateManageCityPriceModelFromJson(jsonString);

import 'dart:convert';

List<AdminRateManageCityPriceModel> adminRateManageCityPriceModelFromJson(String str) => List<AdminRateManageCityPriceModel>.from(json.decode(str).map((x) => AdminRateManageCityPriceModel.fromJson(x)));

String adminRateManageCityPriceModelToJson(List<AdminRateManageCityPriceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminRateManageCityPriceModel {
  String city1Id;
  String city1Name;
  String city2Id;
  String city2Name;
  String rideSharePrice;
  String privateRidePrice;

  AdminRateManageCityPriceModel({
    required this.city1Id,
    required this.city1Name,
    required this.city2Id,
    required this.city2Name,
    required this.rideSharePrice,
    required this.privateRidePrice,
  });

  factory AdminRateManageCityPriceModel.fromJson(Map<String, dynamic> json) => AdminRateManageCityPriceModel(
    city1Id: json["city1_id"],
    city1Name: json["city1_name"],
    city2Id: json["city2_id"],
    city2Name: json["city2_name"],
    rideSharePrice: json["ride_share_price"],
    privateRidePrice: json["private_ride_price"],
  );

  Map<String, dynamic> toJson() => {
    "city1_id": city1Id,
    "city1_name": city1Name,
    "city2_id": city2Id,
    "city2_name": city2Name,
    "ride_share_price": rideSharePrice,
    "private_ride_price": privateRidePrice,
  };
}
