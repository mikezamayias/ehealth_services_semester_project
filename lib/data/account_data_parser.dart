// To parse this JSON data, do
//
//     final accountData = accountDataFromJson(jsonString);

import 'dart:convert';

AccountData accountDataFromJson(String str) =>
    AccountData.fromJson(json.decode(str));

String accountDataToJson(AccountData data) => json.encode(data.toJson());

class AccountData {
  AccountData({
    this.user,
  });

  final User user;

  factory AccountData.fromJson(Map<String, dynamic> json) => AccountData(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    this.age,
    this.ambassador,
    this.avatar,
    this.avatar150,
    this.avatar640,
    this.averageDailySteps,
    this.challengesBeta,
    this.clockTimeDisplayFormat,
    this.corporate,
    this.corporateAdmin,
    this.dateOfBirth,
    this.displayName,
    this.displayNameSetting,
    this.distanceUnit,
    this.encodedId,
    this.features,
    this.firstName,
    this.fullName,
    this.gender,
    this.glucoseUnit,
    this.height,
    this.heightUnit,
    this.isBugReportEnabled,
    this.isChild,
    this.isCoach,
    this.languageLocale,
    this.lastName,
    this.legalTermsAcceptRequired,
    this.locale,
    this.memberSince,
    this.mfaEnabled,
    this.offsetFromUtcMillis,
    this.sdkDeveloper,
    this.sleepTracking,
    this.startDayOfWeek,
    this.strideLengthRunning,
    this.strideLengthRunningType,
    this.strideLengthWalking,
    this.strideLengthWalkingType,
    this.swimUnit,
    this.timezone,
    this.topBadges,
    this.weight,
    this.weightUnit,
  });

  final int age;
  final bool ambassador;
  final String avatar;
  final String avatar150;
  final String avatar640;
  final int averageDailySteps;
  final bool challengesBeta;
  final String clockTimeDisplayFormat;
  final bool corporate;
  final bool corporateAdmin;
  final DateTime dateOfBirth;
  final String displayName;
  final String displayNameSetting;
  final String distanceUnit;
  final String encodedId;
  final Features features;
  final String firstName;
  final String fullName;
  final String gender;
  final String glucoseUnit;
  final int height;
  final String heightUnit;
  final bool isBugReportEnabled;
  final bool isChild;
  final bool isCoach;
  final String languageLocale;
  final String lastName;
  final bool legalTermsAcceptRequired;
  final String locale;
  final DateTime memberSince;
  final bool mfaEnabled;
  final int offsetFromUtcMillis;
  final bool sdkDeveloper;
  final String sleepTracking;
  final String startDayOfWeek;
  final double strideLengthRunning;
  final String strideLengthRunningType;
  final double strideLengthWalking;
  final String strideLengthWalkingType;
  final String swimUnit;
  final String timezone;
  final List<dynamic> topBadges;
  final int weight;
  final String weightUnit;

  factory User.fromJson(Map<String, dynamic> json) => User(
        age: json["age"],
        ambassador: json["ambassador"],
        avatar: json["avatar"],
        avatar150: json["avatar150"],
        avatar640: json["avatar640"],
        averageDailySteps: json["averageDailySteps"],
        challengesBeta: json["challengesBeta"],
        clockTimeDisplayFormat: json["clockTimeDisplayFormat"],
        corporate: json["corporate"],
        corporateAdmin: json["corporateAdmin"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        displayName: json["displayName"],
        displayNameSetting: json["displayNameSetting"],
        distanceUnit: json["distanceUnit"],
        encodedId: json["encodedId"],
        features: Features.fromJson(json["features"]),
        firstName: json["firstName"],
        fullName: json["fullName"],
        gender: json["gender"],
        glucoseUnit: json["glucoseUnit"],
        height: json["height"],
        heightUnit: json["heightUnit"],
        isBugReportEnabled: json["isBugReportEnabled"],
        isChild: json["isChild"],
        isCoach: json["isCoach"],
        languageLocale: json["languageLocale"],
        lastName: json["lastName"],
        legalTermsAcceptRequired: json["legalTermsAcceptRequired"],
        locale: json["locale"],
        memberSince: DateTime.parse(json["memberSince"]),
        mfaEnabled: json["mfaEnabled"],
        offsetFromUtcMillis: json["offsetFromUTCMillis"],
        sdkDeveloper: json["sdkDeveloper"],
        sleepTracking: json["sleepTracking"],
        startDayOfWeek: json["startDayOfWeek"],
        strideLengthRunning: json["strideLengthRunning"].toDouble(),
        strideLengthRunningType: json["strideLengthRunningType"],
        strideLengthWalking: json["strideLengthWalking"].toDouble(),
        strideLengthWalkingType: json["strideLengthWalkingType"],
        swimUnit: json["swimUnit"],
        timezone: json["timezone"],
        topBadges: List<dynamic>.from(json["topBadges"].map((x) => x)),
        weight: json["weight"],
        weightUnit: json["weightUnit"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "ambassador": ambassador,
        "avatar": avatar,
        "avatar150": avatar150,
        "avatar640": avatar640,
        "averageDailySteps": averageDailySteps,
        "challengesBeta": challengesBeta,
        "clockTimeDisplayFormat": clockTimeDisplayFormat,
        "corporate": corporate,
        "corporateAdmin": corporateAdmin,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "displayName": displayName,
        "displayNameSetting": displayNameSetting,
        "distanceUnit": distanceUnit,
        "encodedId": encodedId,
        "features": features.toJson(),
        "firstName": firstName,
        "fullName": fullName,
        "gender": gender,
        "glucoseUnit": glucoseUnit,
        "height": height,
        "heightUnit": heightUnit,
        "isBugReportEnabled": isBugReportEnabled,
        "isChild": isChild,
        "isCoach": isCoach,
        "languageLocale": languageLocale,
        "lastName": lastName,
        "legalTermsAcceptRequired": legalTermsAcceptRequired,
        "locale": locale,
        "memberSince":
            "${memberSince.year.toString().padLeft(4, '0')}-${memberSince.month.toString().padLeft(2, '0')}-${memberSince.day.toString().padLeft(2, '0')}",
        "mfaEnabled": mfaEnabled,
        "offsetFromUTCMillis": offsetFromUtcMillis,
        "sdkDeveloper": sdkDeveloper,
        "sleepTracking": sleepTracking,
        "startDayOfWeek": startDayOfWeek,
        "strideLengthRunning": strideLengthRunning,
        "strideLengthRunningType": strideLengthRunningType,
        "strideLengthWalking": strideLengthWalking,
        "strideLengthWalkingType": strideLengthWalkingType,
        "swimUnit": swimUnit,
        "timezone": timezone,
        "topBadges": List<dynamic>.from(topBadges.map((x) => x)),
        "weight": weight,
        "weightUnit": weightUnit,
      };
}

class Features {
  Features({
    this.exerciseGoal,
  });

  final bool exerciseGoal;

  factory Features.fromJson(Map<String, dynamic> json) => Features(
        exerciseGoal: json["exerciseGoal"],
      );

  Map<String, dynamic> toJson() => {
        "exerciseGoal": exerciseGoal,
      };
}
