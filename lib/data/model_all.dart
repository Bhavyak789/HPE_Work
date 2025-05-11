class LogData2 {
  final String? nbrID;
  final String? routerID;
  final String? areaID;
  final String? IPversion;
  final double? InitAvg;
  final double? DownAvg;
  final double? FullAvg;
  final double? FullSD;
  final double? avgInitToFullTime;
  final double? FullBelowMeanCnt;

  LogData2({
    this.nbrID,
    this.routerID,
    this.areaID,
    this.IPversion,
    this.InitAvg,
    this.DownAvg,
    this.FullAvg,
    this.FullBelowMeanCnt,
    this.FullSD,
    this.avgInitToFullTime,
  });

  factory LogData2.fromJson(Map<String, dynamic> json) {
    return LogData2(
      nbrID: json['nbrID'] ?? "-",
      routerID: json['routerID'] ?? "-",
      areaID: json['areaID'] ?? "-",
      IPversion: json['IPversion'] ?? "-",
      DownAvg: json['DownAvg'] ?? 0, //Down Time
      FullAvg: json['FullAvg'] ?? 0, //Full Time
      // FullBelowMeanCnt:
      //     json['FullBelowMeanCnt'] ??
      //     0, //No. of times full val goes below mean val
      //FullSD: json['FullSD'] ?? 0, // std deviation
      avgInitToFullTime:
          json['avgInitToFullTime'], //?? 0, //Avg Init to full time
      InitAvg: json['InitAvg'], //?? 0, //Init to full time
    );
  }
}
