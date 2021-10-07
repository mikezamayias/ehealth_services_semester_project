// To parse this JSON data, do
//
//     final heartrateData = heartrateDataFromJson(jsonString);

import 'dart:convert';

HeartrateData heartrateDataFromJson(String str) =>
    HeartrateData.fromJson(json.decode(str));

String heartrateDataToJson(HeartrateData data) => json.encode(data.toJson());

class HeartrateData {
  HeartrateData({
    this.activitiesHeart,
  });

  final List<ActivitiesHeart> activitiesHeart;

  factory HeartrateData.fromJson(Map<String, dynamic> json) => HeartrateData(
        activitiesHeart: List<ActivitiesHeart>.from(
            json["activities-heart"].map((x) => ActivitiesHeart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activities-heart":
            List<dynamic>.from(activitiesHeart.map((x) => x.toJson())),
      };
}

class ActivitiesHeart {
  ActivitiesHeart({
    this.dateTime,
    this.minValue,
    this.maxValue,
    this.aveValue,
  });

  final DateTime dateTime;
  final int minValue;
  final int maxValue;
  final int aveValue;

  factory ActivitiesHeart.fromJson(Map<String, dynamic> json) =>
      ActivitiesHeart(
        dateTime: DateTime.parse(json["dateTime"]),
        minValue: json["minValue"],
        maxValue: json["maxValue"],
        aveValue: json["aveValue"],
      );

  Map<String, dynamic> toJson() => {
        "dateTime":
            "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}",
        "minValue": minValue,
        "maxValue": maxValue,
        "aveValue": aveValue,
      };
}
