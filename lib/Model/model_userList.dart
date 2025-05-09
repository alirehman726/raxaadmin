// To parse this JSON data, do
//
//     final modelUserList = modelUserListFromJson(jsonString);

import 'dart:convert';

ModelUserList modelUserListFromJson(String str) => ModelUserList.fromJson(json.decode(str));

String modelUserListToJson(ModelUserList data) => json.encode(data.toJson());

class ModelUserList {
    String message;
    List<UserList> data;

    ModelUserList({
        required this.message,
        required this.data,
    });

    factory ModelUserList.fromJson(Map<String, dynamic> json) => ModelUserList(
        message: json["message"],
        data: List<UserList>.from(json["data"].map((x) => UserList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class UserList {
    int id;
    String name;
    String phoneNumber;
    String colorCode;

    UserList({
        required this.id,
        required this.name,
        required this.phoneNumber,
        required this.colorCode,
    });

    factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        colorCode: json["color_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "color_code": colorCode,
    };
}
