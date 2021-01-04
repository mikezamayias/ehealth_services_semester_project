class AccountDataEntry {
  final dynamic avatar640;
  final dynamic fullName;
  final dynamic dateOfBirth;
  final dynamic age;

  const AccountDataEntry({
    this.avatar640,
    this.fullName,
    this.dateOfBirth,
    this.age,
  });

  factory AccountDataEntry.fromJson(Map<dynamic, dynamic> parsedJsonData) {
    if (parsedJsonData == null) {
      return null;
    }
    return AccountDataEntry(
      avatar640: parsedJsonData['avatar640'],
      fullName: parsedJsonData['fullName'],
      dateOfBirth: parsedJsonData['dateOfBirth'],
      age: parsedJsonData['age'],
    );
  }

  @override
  String toString() {
    return '{${this.avatar640}, ${this.fullName}, ${this.dateOfBirth}, ${this.age}}';
  }
}
