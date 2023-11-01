// To parse this JSON data, do
//
//     final agencyModel = agencyModelFromJson(jsonString);

import 'dart:convert';

List<AgencyModel> agencyModelFromJson(String str) => List<AgencyModel>.from(json.decode(str).map((x) => AgencyModel.fromJson(x)));

String agencyModelToJson(List<AgencyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgencyModel {
  String agencyId;
  String agencyName;

  AgencyModel({
    required this.agencyId,
    required this.agencyName,
  });

  factory AgencyModel.fromJson(Map<String, dynamic> json) => AgencyModel(
    agencyId: json["agency_id"],
    agencyName: json["agency_name"],
  );

  Map<String, dynamic> toJson() => {
    "agency_id": agencyId,
    "agency_name": agencyName,
  };
}
