
// To parse this JSON data, do
//
//     final adminFetchDriverModel = adminFetchDriverModelFromJson(jsonString);

import 'dart:convert';

List<AdminFetchDriverModel> adminFetchDriverModelFromJson(String str) => List<AdminFetchDriverModel>.from(json.decode(str).map((x) => AdminFetchDriverModel.fromJson(x)));

String adminFetchDriverModelToJson(List<AdminFetchDriverModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminFetchDriverModel {
  String driverId;
  String driverName;
  String email;
  String phone;
  String address;
  String status;

  AdminFetchDriverModel({
    required this.driverId,
    required this.driverName,
    required this.email,
    required this.phone,
    required this.address,
    required this.status,
  });

  factory AdminFetchDriverModel.fromJson(Map<String, dynamic> json) => AdminFetchDriverModel(
    driverId: json["driver_id"],
    driverName: json["driver_name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "driver_id": driverId,
    "driver_name": driverName,
    "email": email,
    "phone": phone,
    "address": address,
    "status": status,
  };
}

