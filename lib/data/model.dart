class LogData {
  final String? nbrID;
  final String? routerID;
  final String? areaID;
  final String? IPversion;
  final double? Init;
  final double? Full;

  LogData({
    this.nbrID,
    this.routerID,
    this.areaID,
    this.IPversion,
    this.Init,
    this.Full,
  });

  factory LogData.fromJson(Map<String, dynamic> json) {
    return LogData(
      nbrID: json['nbrID'] ?? "-",
      routerID: json['routerID'] ?? "-",
      areaID: json['areaID'] ?? "-",
      IPversion: json['IPversion'] ?? "-",
      Init: json['Init'] ?? -1,
      Full: json['Full'] ?? -1,
    );
  }
}
