// To parse this JSON data, do
//
//     final modelAllAds = modelAllAdsFromJson(jsonString);

import 'dart:convert';

ModelAllAds modelAllAdsFromJson(String str) =>
    ModelAllAds.fromJson(json.decode(str));

String modelAllAdsToJson(ModelAllAds data) => json.encode(data.toJson());

class ModelAllAds {
  bool status;
  List<AllAds> data;

  ModelAllAds({
    required this.status,
    required this.data,
  });

  factory ModelAllAds.fromJson(Map<String, dynamic> json) => ModelAllAds(
        status: json["status"],
        data: List<AllAds>.from(json["data"].map((x) => AllAds.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AllAds {
  int id;
  String status;
  String date;
  String userName;

  AllAds({
    required this.id,
    required this.status,
    required this.date,
    required this.userName,
  });

  factory AllAds.fromJson(Map<String, dynamic> json) => AllAds(
        id: json["id"],
        status: json["status"],
        date: json["date"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "date": date,
        "user_name": userName,
      };
}
