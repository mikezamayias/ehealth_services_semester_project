import 'dart:convert';
import 'dart:io';

import 'package:final_project/constants.dart';
import 'package:final_project/data/account_data_entries.dart';
import 'package:final_project/data/heartrate_data_entries.dart';
import 'package:final_project/data/sleep_data_entries.dart';

void main() {
  List<HeartrateDataEntry> heartrateDataEntries = fetchHeartrateData(
    heartrateData['jsonPath'],
    heartrateData['jsonKey'],
  );

  List<SleepDataEntry> sleepDataEntries = fetchSleepData(
    sleepData['jsonPath'],
    sleepData['jsonKey'],
  );

  AccountDataEntry accountDataEntry = fetchAccountData(
    accountData['jsonPath'],
  );

  heartrateDataEntries.forEach((heartrateDataEntry) {
    print(heartrateDataEntry.toString());
  });

  sleepDataEntries.forEach((sleepDataEntry) {
    print(sleepDataEntry.toString());
  });

  print(accountDataEntry.toString());
}

/*
/// Code before refactoring. Now implemented with following code.
List<SleepDataEntry> fetchSleepData(String jsonPath) {
  String parsedJsonFile = File(jsonPath).readAsStringSync();
  Map<dynamic, dynamic> jsonData = jsonDecode(parsedJsonFile)..entries;
  print(jsonData.runtimeType);
  var parsedJsonData = jsonData['sleep'];
  return List.generate(
    parsedJsonData.length,
    (index) => SleepDataEntry.fromJson(
      parsedJsonData[index],
    ),
  );
}
*/

List<SleepDataEntry> fetchSleepData(String jsonFilePath, String dataKey) {
  List<dynamic> parsedSleepData = fetchVitalData(jsonFilePath, dataKey);
  return List.generate(
    parsedSleepData.length,
    (index) => SleepDataEntry.fromJson(parsedSleepData[index]),
  );
}

List<HeartrateDataEntry> fetchHeartrateData(
    String jsonFilePath, String dataKey) {
  List<dynamic> parsedHeartrateData = fetchVitalData(jsonFilePath, dataKey);
  return List.generate(
    parsedHeartrateData.length,
    (index) => HeartrateDataEntry.fromJson(parsedHeartrateData[index]),
  );
}

AccountDataEntry fetchAccountData(String jsonFilePath) {
  List<String> dataKeys = ['avatar640', 'fullName', 'dateOfBirth', 'age'];
  Map<dynamic, dynamic> parsedAccountData =
      fetchProfileData('assets/data/account.json', 'user');
  return AccountDataEntry.fromJson(parsedAccountData);
}

List<dynamic> fetchVitalData(String jsonPath, String jsonKey) {
  String readJsonFileAsString = File(jsonPath).readAsStringSync();
  Map<dynamic, dynamic> fetchJsonEntries = jsonDecode(readJsonFileAsString)
    ..entries;
  List<dynamic> parsedData = fetchJsonEntries[jsonKey];
  return parsedData;
}

Map<dynamic, dynamic> fetchProfileData(String jsonPath, String jsonKey) {
  String readJsonFileAsString = File(jsonPath).readAsStringSync();
  Map<dynamic, dynamic> fetchJsonEntries = jsonDecode(readJsonFileAsString)
    ..entries;
  return fetchJsonEntries[jsonKey];
}

List<dynamic> parseData(Map<dynamic, dynamic> parsedJsonData, String dataKey) =>
    parsedJsonData[dataKey][dataKey];

Map<dynamic, dynamic> getJsonEntries(String parsedJsonFile) =>
    jsonDecode(parsedJsonFile)..entries;

String readJsonFile(String jsonFilePath) =>
    File(jsonFilePath).readAsStringSync();
