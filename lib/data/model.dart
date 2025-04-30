class LogData {
  final String? nbrID;
  final String? routerID;
  final String? areaID;
  final String? IPversion;
  final double? Down;
  final double? Full;

  LogData({
    this.nbrID,
    this.routerID,
    this.areaID,
    this.IPversion,
    this.Down,
    this.Full,
  });

  factory LogData.fromJson(Map<String, dynamic> json) {
    return LogData(
      nbrID: json['nbrID'] ?? "-",
      routerID: json['routerID'] ?? "-",
      areaID: json['areaID'] ?? "-",
      IPversion: json['IPversion'] ?? "-",
      Down: json['Down'] ?? -1,
      Full: json['Full'] ?? -1,
    );
  }
}
