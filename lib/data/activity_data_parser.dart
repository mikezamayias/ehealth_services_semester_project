// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'dart:convert';

ActivityData activityDataFromJson(String str) =>
    ActivityData.fromJson(json.decode(str));

String activityDataToJson(ActivityData data) => json.encode(data.toJson());

class ActivityData {
  ActivityData({
    this.activities,
    this.pagination,
  });

  final List<Activity> activities;
  final Pagination pagination;

  factory ActivityData.fromJson(Map<String, dynamic> json) => ActivityData(
        activities: json["activities"] == null
            ? null
            : List<Activity>.from(
                json["activities"].map((x) => Activity.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "activities": activities == null
            ? null
            : List<dynamic>.from(activities.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Activity {
  Activity({
    this.activeDuration,
    this.activityLevel,
    this.activityName,
    this.activityTypeId,
    this.calories,
    this.caloriesLink,
    this.distance,
    this.distanceUnit,
    this.duration,
    this.hasActiveZoneMinutes,
    this.lastModified,
    this.logId,
    this.logType,
    this.manualValuesSpecified,
    this.originalDuration,
    this.originalStartTime,
    this.pace,
    this.source,
    this.speed,
    this.startTime,
    this.steps,
  });

  final int activeDuration;
  final List<ActivityLevel> activityLevel;
  final String activityName;
  final int activityTypeId;
  final int calories;
  final String caloriesLink;
  final int distance;
  final String distanceUnit;
  final int duration;
  final bool hasActiveZoneMinutes;
  final DateTime lastModified;
  final int logId;
  final String logType;
  final ManualValuesSpecified manualValuesSpecified;
  final int originalDuration;
  final DateTime originalStartTime;
  final double pace;
  final Source source;
  final int speed;
  final DateTime startTime;
  final int steps;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        activeDuration:
            json["activeDuration"],
        activityLevel: json["activityLevel"] == null
            ? null
            : List<ActivityLevel>.from(
                json["activityLevel"].map((x) => ActivityLevel.fromJson(x))),
        activityName:
            json["activityName"],
        activityTypeId:
            json["activityTypeId"],
        calories: json["calories"],
        caloriesLink:
            json["caloriesLink"],
        distance: json["distance"],
        distanceUnit:
            json["distanceUnit"],
        duration: json["duration"],
        hasActiveZoneMinutes: json["hasActiveZoneMinutes"],
        lastModified: json["lastModified"] == null
            ? null
            : DateTime.parse(json["lastModified"]),
        logId: json["logId"],
        logType: json["logType"],
        manualValuesSpecified: json["manualValuesSpecified"] == null
            ? null
            : ManualValuesSpecified.fromJson(json["manualValuesSpecified"]),
        originalDuration:
            json["originalDuration"],
        originalStartTime: json["originalStartTime"] == null
            ? null
            : DateTime.parse(json["originalStartTime"]),
        pace: json["pace"]?.toDouble(),
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        speed: json["speed"],
        startTime: json["startTime"] == null
            ? null
            : DateTime.parse(json["startTime"]),
        steps: json["steps"],
      );

  Map<String, dynamic> toJson() => {
        "activeDuration": activeDuration,
        "activityLevel": activityLevel == null
            ? null
            : List<dynamic>.from(activityLevel.map((x) => x.toJson())),
        "activityName": activityName,
        "activityTypeId": activityTypeId,
        "calories": calories,
        "caloriesLink": caloriesLink,
        "distance": distance,
        "distanceUnit": distanceUnit,
        "duration": duration,
        "hasActiveZoneMinutes":
            hasActiveZoneMinutes,
        "lastModified":
            lastModified?.toIso8601String(),
        "logId": logId,
        "logType": logType,
        "manualValuesSpecified": manualValuesSpecified?.toJson(),
        "originalDuration": originalDuration,
        "originalStartTime": originalStartTime?.toIso8601String(),
        "pace": pace,
        "source": source?.toJson(),
        "speed": speed,
        "startTime": startTime?.toIso8601String(),
        "steps": steps,
      };
}

class ActivityLevel {
  ActivityLevel({
    this.minutes,
    this.name,
  });

  final int minutes;
  final Name name;

  factory ActivityLevel.fromJson(Map<String, dynamic> json) => ActivityLevel(
        minutes: json["minutes"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
      );

  Map<String, dynamic> toJson() => {
        "minutes": minutes,
        "name": name == null ? null : nameValues.reverse[name],
      };
}

enum Name { sedentary, lightly, fairly, very }

final nameValues = EnumValues({
  "fairly": Name.fairly,
  "lightly": Name.lightly,
  "sedentary": Name.sedentary,
  "very": Name.very
});

class ManualValuesSpecified {
  ManualValuesSpecified({
    this.calories,
    this.distance,
    this.steps,
  });

  final bool calories;
  final bool distance;
  final bool steps;

  factory ManualValuesSpecified.fromJson(Map<String, dynamic> json) =>
      ManualValuesSpecified(
        calories: json["calories"],
        distance: json["distance"],
        steps: json["steps"],
      );

  Map<String, dynamic> toJson() => {
        "calories": calories,
        "distance": distance,
        "steps": steps,
      };
}

class Source {
  Source({
    this.id,
    this.name,
    this.trackerFeatures,
    this.type,
    this.url,
  });

  final String id;
  final String name;
  final List<dynamic> trackerFeatures;
  final String type;
  final String url;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
        trackerFeatures: json["trackerFeatures"] == null
            ? null
            : List<dynamic>.from(json["trackerFeatures"].map((x) => x)),
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "trackerFeatures": trackerFeatures == null
            ? null
            : List<dynamic>.from(trackerFeatures.map((x) => x)),
        "type": type,
        "url": url,
      };
}

class Pagination {
  Pagination({
    this.beforeDate,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.sort,
  });

  final DateTime beforeDate;
  final int limit;
  final String next;
  final int offset;
  final String previous;
  final String sort;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        beforeDate: json["beforeDate"] == null
            ? null
            : DateTime.parse(json["beforeDate"]),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        sort: json["sort"],
      );

  Map<String, dynamic> toJson() => {
        "beforeDate": beforeDate == null
            ? null
            : "${beforeDate.year.toString().padLeft(4, '0')}-${beforeDate.month.toString().padLeft(2, '0')}-${beforeDate.day.toString().padLeft(2, '0')}",
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "sort": sort,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
