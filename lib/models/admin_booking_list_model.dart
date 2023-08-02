
// To parse this JSON data, do
//
//     final adminBookingListModel = adminBookingListModelFromJson(jsonString);

import 'dart:convert';

List<AdminBookingListModel> adminBookingListModelFromJson(String str) => List<AdminBookingListModel>.from(json.decode(str).map((x) => AdminBookingListModel.fromJson(x)));

String adminBookingListModelToJson(List<AdminBookingListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminBookingListModel {
  String bookingId;
  String destination;
  String source;
  String status;
  String userName;
  String driverName;
  String vehicleType;
  String bookTime;
  String bookDate;
  String totalAmount;
  String categoryName;

  AdminBookingListModel({
    required this.bookingId,
    required this.destination,
    required this.source,
    required this.status,
    required this.userName,
    required this.driverName,
    required this.vehicleType,
    required this.bookTime,
    required this.bookDate,
    required this.totalAmount,
    required this.categoryName,
  });

  factory AdminBookingListModel.fromJson(Map<String, dynamic> json) => AdminBookingListModel(
    bookingId: json["booking_id"],
    destination: json["destination"],
    source: json["source"],
    status: json["status"],
    userName: json["user_name"],
    driverName: json["driver_name"],
    vehicleType: json["vehicle_type"],
    bookTime: json["book_time"],
    bookDate: json["book_date"],
    totalAmount: json["total_amount"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "destination": destination,
    "source": source,
    "status": status,
    "user_name": userName,
    "driver_name": driverName,
    "vehicle_type": vehicleType,
    "book_time": bookTime,
    "book_date": bookDate,
    "total_amount": totalAmount,
    "category_name": categoryName,
  };
}
