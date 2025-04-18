// To parse this JSON data, do
//
//     final modelCity = modelCityFromJson(jsonString);

import 'dart:convert';

ModelCity modelCityFromJson(String str) => ModelCity.fromJson(json.decode(str));

String modelCityToJson(ModelCity data) => json.encode(data.toJson());

class ModelCity {
    String message;
    List<Data> data;

    ModelCity({
        required this.message,
        required this.data,
    });

    factory ModelCity.fromJson(Map<String, dynamic> json) => ModelCity(
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data {
    int id;
    String name;

    Data({
        required this.id,
        required this.name,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
