class SleepDataEntry {
  final String dateOfSleep;
  final int duration;

  const SleepDataEntry({
    this.dateOfSleep,
    this.duration,
  });

  factory SleepDataEntry.fromJson(Map<dynamic, dynamic> parsedJsonData) {
    if (parsedJsonData == null) {
      return null;
    }
    return SleepDataEntry(
      dateOfSleep: parsedJsonData['dateOfSleep'],
      duration: parsedJsonData['duration'],
    );
  }

  @override
  String toString() {
    return '{${this.dateOfSleep}, ${this.duration}}';
  }
}
