import 'dart:convert';
import 'dart:io';

import 'package:final_project/data/heartrate_data_entries.dart';
import 'package:final_project/data/sleep_data_entries.dart';

void main() {
  List<HeartrateDataEntry> heartrateDataEntries =
      fetchHeartrateData('assets/data/heartrate.json');
  List<SleepDataEntry> sleepDataEntries =
      fetchSleepData('assets/data/sleep.json');

  print(heartrateDataEntries[0].dateTime);
}

List<HeartrateDataEntry> fetchHeartrateData(String jsonPath) {
  String parsedJson = File(jsonPath).readAsStringSync();
  var jsonData = jsonDecode(parsedJson)..entries;
  var parsedData = jsonData['activities-heart'];
  return List.generate(
    parsedData.length,
    (index) => HeartrateDataEntry.fromJson(
      parsedData[index],
    ),
  );
}

List<SleepDataEntry> fetchSleepData(String jsonPath) {
  String parsedJson = File(jsonPath).readAsStringSync();
  var jsonData = jsonDecode(parsedJson)..entries;
  var parsedData = jsonData['sleep'];
  return List.generate(
    parsedData.length,
    (index) => SleepDataEntry.fromJson(
      parsedData[index],
    ),
  );
}
