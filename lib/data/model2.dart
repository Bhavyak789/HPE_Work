class LogData2 {
  final String? nbrID;
  final String? routerID;
  final String? areaID;
  final String? IPversion;
  final double? Attempt;
  final double? Init;
  final double? TwoWay;
  final double? Exstart;
  final double? Exchange;
  final double? Loading;
  final double? Down;
  final double? Full;

  LogData2({
    this.nbrID,
    this.routerID,
    this.areaID,
    this.IPversion,
    this.Attempt,
    this.Init,
    this.TwoWay,
    this.Exstart,
    this.Exchange,
    this.Loading,
    this.Down,
    this.Full,
  });

  factory LogData2.fromJson(Map<String, dynamic> json) {
    return LogData2(
      nbrID: json['nbrID'] ?? "-",
      routerID: json['routerID'] ?? "-",
      areaID: json['areaID'] ?? "-",
      IPversion: json['IPversion'] ?? "-",
      Down: json['Down'] ?? -1,
      Full: json['Full'] ?? -1,
      Attempt: json['Attempt'] ?? -1,
      Init: json['Init'] ?? "-",
      TwoWay: json['TwoWay'] ?? -1,
      Exstart: json['Exstart'] ?? -1,
      Exchange: json['Exchange'] ?? -1,
      Loading: json['Loading'] ?? -1,
    );
  }
}
