
// To parse this JSON data, do
//
//     final surgePriceModel = surgePriceModelFromJson(jsonString);

import 'dart:convert';

List<SurgePriceModel> surgePriceModelFromJson(String str) => List<SurgePriceModel>.from(json.decode(str).map((x) => SurgePriceModel.fromJson(x)));

String surgePriceModelToJson(List<SurgePriceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurgePriceModel {
  String surgeId;
  String surgeName;
  String surgeTime;
  String price;

  SurgePriceModel({
    required this.surgeId,
    required this.surgeName,
    required this.surgeTime,
    required this.price,
  });

  factory SurgePriceModel.fromJson(Map<String, dynamic> json) => SurgePriceModel(
    surgeId: json["surge_id"],
    surgeName: json["surge_name"],
    surgeTime: json["surge_time"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "surge_id": surgeId,
    "surge_name": surgeName,
    "surge_time": surgeTime,
    "price": price,
  };
}
