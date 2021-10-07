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
        "pagination": pagination == null ? null : pagination.toJson(),
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
            json["activeDuration"] == null ? null : json["activeDuration"],
        activityLevel: json["activityLevel"] == null
            ? null
            : List<ActivityLevel>.from(
                json["activityLevel"].map((x) => ActivityLevel.fromJson(x))),
        activityName:
            json["activityName"] == null ? null : json["activityName"],
        activityTypeId:
            json["activityTypeId"] == null ? null : json["activityTypeId"],
        calories: json["calories"] == null ? null : json["calories"],
        caloriesLink:
            json["caloriesLink"] == null ? null : json["caloriesLink"],
        distance: json["distance"] == null ? null : json["distance"],
        distanceUnit:
            json["distanceUnit"] == null ? null : json["distanceUnit"],
        duration: json["duration"] == null ? null : json["duration"],
        hasActiveZoneMinutes: json["hasActiveZoneMinutes"] == null
            ? null
            : json["hasActiveZoneMinutes"],
        lastModified: json["lastModified"] == null
            ? null
            : DateTime.parse(json["lastModified"]),
        logId: json["logId"] == null ? null : json["logId"],
        logType: json["logType"] == null ? null : json["logType"],
        manualValuesSpecified: json["manualValuesSpecified"] == null
            ? null
            : ManualValuesSpecified.fromJson(json["manualValuesSpecified"]),
        originalDuration:
            json["originalDuration"] == null ? null : json["originalDuration"],
        originalStartTime: json["originalStartTime"] == null
            ? null
            : DateTime.parse(json["originalStartTime"]),
        pace: json["pace"] == null ? null : json["pace"].toDouble(),
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        speed: json["speed"] == null ? null : json["speed"],
        startTime: json["startTime"] == null
            ? null
            : DateTime.parse(json["startTime"]),
        steps: json["steps"] == null ? null : json["steps"],
      );

  Map<String, dynamic> toJson() => {
        "activeDuration": activeDuration == null ? null : activeDuration,
        "activityLevel": activityLevel == null
            ? null
            : List<dynamic>.from(activityLevel.map((x) => x.toJson())),
        "activityName": activityName == null ? null : activityName,
        "activityTypeId": activityTypeId == null ? null : activityTypeId,
        "calories": calories == null ? null : calories,
        "caloriesLink": caloriesLink == null ? null : caloriesLink,
        "distance": distance == null ? null : distance,
        "distanceUnit": distanceUnit == null ? null : distanceUnit,
        "duration": duration == null ? null : duration,
        "hasActiveZoneMinutes":
            hasActiveZoneMinutes == null ? null : hasActiveZoneMinutes,
        "lastModified":
            lastModified == null ? null : lastModified.toIso8601String(),
        "logId": logId == null ? null : logId,
        "logType": logType == null ? null : logType,
        "manualValuesSpecified": manualValuesSpecified == null
            ? null
            : manualValuesSpecified.toJson(),
        "originalDuration": originalDuration == null ? null : originalDuration,
        "originalStartTime": originalStartTime == null
            ? null
            : originalStartTime.toIso8601String(),
        "pace": pace == null ? null : pace,
        "source": source == null ? null : source.toJson(),
        "speed": speed == null ? null : speed,
        "startTime": startTime == null ? null : startTime.toIso8601String(),
        "steps": steps == null ? null : steps,
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
        minutes: json["minutes"] == null ? null : json["minutes"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
      );

  Map<String, dynamic> toJson() => {
        "minutes": minutes == null ? null : minutes,
        "name": name == null ? null : nameValues.reverse[name],
      };
}

enum Name { SEDENTARY, LIGHTLY, FAIRLY, VERY }

final nameValues = EnumValues({
  "fairly": Name.FAIRLY,
  "lightly": Name.LIGHTLY,
  "sedentary": Name.SEDENTARY,
  "very": Name.VERY
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
        calories: json["calories"] == null ? null : json["calories"],
        distance: json["distance"] == null ? null : json["distance"],
        steps: json["steps"] == null ? null : json["steps"],
      );

  Map<String, dynamic> toJson() => {
        "calories": calories == null ? null : calories,
        "distance": distance == null ? null : distance,
        "steps": steps == null ? null : steps,
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
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        trackerFeatures: json["trackerFeatures"] == null
            ? null
            : List<dynamic>.from(json["trackerFeatures"].map((x) => x)),
        type: json["type"] == null ? null : json["type"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "trackerFeatures": trackerFeatures == null
            ? null
            : List<dynamic>.from(trackerFeatures.map((x) => x)),
        "type": type == null ? null : type,
        "url": url == null ? null : url,
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
        limit: json["limit"] == null ? null : json["limit"],
        next: json["next"] == null ? null : json["next"],
        offset: json["offset"] == null ? null : json["offset"],
        previous: json["previous"] == null ? null : json["previous"],
        sort: json["sort"] == null ? null : json["sort"],
      );

  Map<String, dynamic> toJson() => {
        "beforeDate": beforeDate == null
            ? null
            : "${beforeDate.year.toString().padLeft(4, '0')}-${beforeDate.month.toString().padLeft(2, '0')}-${beforeDate.day.toString().padLeft(2, '0')}",
        "limit": limit == null ? null : limit,
        "next": next == null ? null : next,
        "offset": offset == null ? null : offset,
        "previous": previous == null ? null : previous,
        "sort": sort == null ? null : sort,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
