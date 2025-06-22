class LogData2 {
  final String? currentDateAndTime;
  final String? currentState;
  final String? nbrID;
  final String? routerID;
  final String? areaID;
  final String? IPversion;
  final double? InitAvg;
  final double? DownAvg;
  final double? FullAvg;
  final double? FullSD;
  final double? avgInitToFullTime;
  final double? numberOfTimesFullTimeGoesBelowMeanFullTime;

  LogData2({
    this.currentDateAndTime,
    this.currentState,
    this.nbrID,
    this.routerID,
    this.areaID,
    this.IPversion,
    this.InitAvg,
    this.DownAvg,
    this.FullAvg,
    this.numberOfTimesFullTimeGoesBelowMeanFullTime, //FullBelowMeanCnt
    this.FullSD,
    this.avgInitToFullTime,
  });

  factory LogData2.fromJson(Map<String, dynamic> json) {
    return LogData2(
      nbrID: json['nbrID'] ?? "-",
      routerID: json['routerID'] ?? "-",
      areaID: json['areaID'] ?? "-",
      IPversion: json['IPversion'] ?? "-",
      DownAvg: json['DownAvg'] ?? 0.0, //Down Time
      FullAvg: json['FullAvg'] ?? 0.0, //Full Time
      // numberOfTimesFullTimeGoesBelowMeanFullTime:
      //     json['numberOfTimesFullTimeGoesBelowMeanFullTime'] ??
      //     0, //No. of times full val goes below mean val
      //FullSD: json['FullSD'] ?? 0, // std deviation
      avgInitToFullTime:
          json['avgInitToFullTime'], //?? 0, //Avg Init to full time
      InitAvg: json['InitAvg'], //?? 0, //Init to full time
      currentState: json['currentcurrentState'] ?? "-",
      currentDateAndTime: json['currentDateAndTime'] ?? "-",
    );
  }
}
