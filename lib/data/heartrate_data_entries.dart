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

  factory HeartrateDataEntry.fromJson(Map<dynamic, dynamic> parsedJsonData) {
    if (parsedJsonData == null) {
      return null;
    }
    return HeartrateDataEntry(
      dateTime: parsedJsonData['dateTime'],
      minValue: parsedJsonData['minValue'],
      maxValue: parsedJsonData['maxValue'],
      aveValue: parsedJsonData['aveValue'],
    );
  }

  @override
  String toString() {
    return '{${this.dateTime}, ${this.minValue}, ${this.maxValue}, ${this.aveValue}}';
  }
}
