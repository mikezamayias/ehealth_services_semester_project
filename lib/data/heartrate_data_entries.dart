class HeartrateDataEntry {
  final String dateTime;
  final int minValue;
  final int maxValue;
  final int aveValue;

  const HeartrateDataEntry({
    this.dateTime,
    this.minValue,
    this.maxValue,
    this.aveValue,
  });

  factory HeartrateDataEntry.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return HeartrateDataEntry(
      dateTime: json['dateTime'],
      minValue: json['minValue'],
      maxValue: json['maxValue'],
      aveValue: json['aveValue'],
    );
  }
}
