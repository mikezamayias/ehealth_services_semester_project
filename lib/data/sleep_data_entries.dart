class SleepDataEntry {
  final String dateTime;
  final int duration;

  const SleepDataEntry({
    this.dateTime,
    this.duration,
  });

  factory SleepDataEntry.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return SleepDataEntry(
      dateTime: json['dateTime'],
      duration: json['duration'],
    );
  }
}
