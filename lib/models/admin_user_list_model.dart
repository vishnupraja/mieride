
// To parse this JSON data, do
//
//     final adminUserListModel = adminUserListModelFromJson(jsonString);

import 'dart:convert';

List<AdminUserListModel> adminUserListModelFromJson(String str) => List<AdminUserListModel>.from(json.decode(str).map((x) => AdminUserListModel.fromJson(x)));

String adminUserListModelToJson(List<AdminUserListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminUserListModel {
  String userId;
  String userName;
  String email;
  String walletBalance;

  AdminUserListModel({
    required this.userId,
    required this.userName,
    required this.email,
    required this.walletBalance,
  });

  factory AdminUserListModel.fromJson(Map<String, dynamic> json) => AdminUserListModel(
    userId: json["user_id"],
    userName: json["user_name"],
    email: json["email"],
    walletBalance: json["wallet_balance"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
    "email": email,
    "wallet_balance": walletBalance,
  };
}
