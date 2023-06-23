// To parse this JSON data, do
//
//     final sleepData = sleepDataFromJson(jsonString);

import 'dart:convert';

SleepData sleepDataFromJson(String str) => SleepData.fromJson(json.decode(str));

String sleepDataToJson(SleepData data) => json.encode(data.toJson());

class SleepData {
    SleepData({
        this.pagination,
        this.sleep,
    });

    final Pagination? pagination;
    final List<Sleep>? sleep;

    factory SleepData.fromJson(Map<String, dynamic> json) => SleepData(
        pagination: Pagination.fromJson(json["pagination"]),
        sleep: List<Sleep>.from(json["sleep"].map((x) => Sleep.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination!.toJson(),
        "sleep": List<dynamic>.from(sleep!.map((x) => x.toJson())),
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

    final DateTime? beforeDate;
    final int? limit;
    final String? next;
    final int? offset;
    final String? previous;
    final String? sort;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        beforeDate: DateTime.parse(json["beforeDate"]),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        sort: json["sort"],
    );

    Map<String, dynamic> toJson() => {
        "beforeDate": "${beforeDate?.year.toString().padLeft(4, '0')}-${beforeDate?.month.toString().padLeft(2, '0')}-${beforeDate?.day.toString().padLeft(2, '0')}",
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "sort": sort,
    };
}

class Sleep {
    Sleep({
        this.dateOfSleep,
        this.duration,
        this.efficiency,
        this.endTime,
        this.infoCode,
        this.isMainSleep,
        this.levels,
        this.logId,
        this.minutesAfterWakeup,
        this.minutesAsleep,
        this.minutesAwake,
        this.minutesToFallAsleep,
        this.startTime,
        this.timeInBed,
        this.type,
    });

    final DateTime? dateOfSleep;
    final int? duration;
    final int? efficiency;
    final DateTime? endTime;
    final int? infoCode;
    final bool? isMainSleep;
    final Levels? levels;
    final int? logId;
    final int? minutesAfterWakeup;
    final int? minutesAsleep;
    final int? minutesAwake;
    final int? minutesToFallAsleep;
    final DateTime? startTime;
    final int? timeInBed;
    final String? type;

    factory Sleep.fromJson(Map<String, dynamic> json) => Sleep(
        dateOfSleep: DateTime.parse(json["dateOfSleep"]),
        duration: json["duration"],
        efficiency: json["efficiency"],
        endTime: DateTime.parse(json["endTime"]),
        infoCode: json["infoCode"],
        isMainSleep: json["isMainSleep"],
        levels: Levels.fromJson(json["levels"]),
        logId: json["logId"],
        minutesAfterWakeup: json["minutesAfterWakeup"],
        minutesAsleep: json["minutesAsleep"],
        minutesAwake: json["minutesAwake"],
        minutesToFallAsleep: json["minutesToFallAsleep"],
        startTime: DateTime.parse(json["startTime"]),
        timeInBed: json["timeInBed"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "dateOfSleep": "${dateOfSleep!.year.toString().padLeft(4, '0')}-${dateOfSleep?.month.toString().padLeft(2, '0')}-${dateOfSleep!.day.toString().padLeft(2, '0')}",
        "duration": duration,
        "efficiency": efficiency,
        "endTime": endTime?.toIso8601String(),
        "infoCode": infoCode,
        "isMainSleep": isMainSleep,
        "levels": levels?.toJson(),
        "logId": logId,
        "minutesAfterWakeup": minutesAfterWakeup,
        "minutesAsleep": minutesAsleep,
        "minutesAwake": minutesAwake,
        "minutesToFallAsleep": minutesToFallAsleep,
        "startTime": startTime?.toIso8601String(),
        "timeInBed": timeInBed,
        "type": type,
    };
}

class Levels {
    Levels({
        this.data,
        this.summary,
    });

    final List<Datum>? data;
    final Summary? summary;

    factory Levels.fromJson(Map<String, dynamic> json) => Levels(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        summary: Summary.fromJson(json["summary"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "summary": summary!.toJson(),
    };
}

class Datum {
    Datum({
        this.dateTime,
        this.level,
        this.seconds,
    });

    final DateTime? dateTime;
    final String? level;
    final int? seconds;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        dateTime: DateTime.parse(json["dateTime"]),
        level: json["level"],
        seconds: json["seconds"],
    );

    Map<String, dynamic> toJson() => {
        "dateTime": dateTime!.toIso8601String(),
        "level": level,
        "seconds": seconds,
    };
}

class Summary {
    Summary({
        this.asleep,
        this.awake,
        this.restless,
    });

    final Asleep? asleep;
    final Asleep? awake;
    final Asleep? restless;

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        asleep: Asleep.fromJson(json["asleep"]),
        awake: Asleep.fromJson(json["awake"]),
        restless: Asleep.fromJson(json["restless"]),
    );

    Map<String, dynamic> toJson() => {
        "asleep": asleep!.toJson(),
        "awake": awake!.toJson(),
        "restless": restless!.toJson(),
    };
}

class Asleep {
    Asleep({
        this.count,
        this.minutes,
    });

    final int? count;
    final int? minutes;

    factory Asleep.fromJson(Map<String, dynamic> json) => Asleep(
        count: json["count"],
        minutes: json["minutes"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "minutes": minutes,
    };
}
