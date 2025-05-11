class LogData {
  final String? nbrID;
  final String? routerID;
  final String? areaID;
  final String? IPversion;
  final double? DownAvg;
  final double? FullAvg;
  final double? FullSD;
  final double? avgInitToFullTime;
  final double? FullBelowMeanCnt;

  LogData({
    this.nbrID,
    this.routerID,
    this.areaID,
    this.IPversion,
    this.DownAvg,
    this.FullAvg,
    this.FullBelowMeanCnt,
    this.FullSD,
    this.avgInitToFullTime,
  });

  factory LogData.fromJson(Map<String, dynamic> json) {
    return LogData(
      nbrID: json['nbrID'] ?? "-",
      routerID: json['routerID'] ?? "-",
      areaID: json['areaID'] ?? "-",
      IPversion: json['IPversion'] ?? "-",
      DownAvg: json['DownAvg'] ?? 0,
      FullAvg: json['FullAvg'] ?? 0,
      FullBelowMeanCnt: json['FullBelowMeanCnt'], //?? 0,
      //No. of times full val goes below mean val
      FullSD: json['FullSD'], //?? -1, // std deviation
      avgInitToFullTime:
          json['avgInitToFullTime'], // ?? 0, //Avg Init to full time
    );
  }
}
