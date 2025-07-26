// Data model for "Stable" and "Unstable" tables

class LogData {
  final String? event;
  final String? currentDateAndTime;
  final String? currentState;
  final String? nbrID;
  final String? routerID;
  final String? areaID;
  final String? IPversion;
  final String? status;
  final double? timeLeftOnCurrentState; // Predicted Up Time
  final double? DownAvg;
  final double? FullAvg;
  final double? FullSD;
  final double? avgInitToFullTime;
  final int? numberOfTimesFullTimeGoesBelowMeanFullTime;
  final int?
  numberOfTimesInitToFullTimeGoesAboveMeanInitToFullTime; //initToFullTimeAboveMeanCnt
  final double? timePassedOnCurrentState;

  LogData({
    this.timePassedOnCurrentState,
    this.event,
    this.currentDateAndTime,
    this.currentState,
    this.nbrID,
    this.routerID,
    this.areaID,
    this.IPversion,
    this.DownAvg,
    this.FullAvg,
    this.numberOfTimesFullTimeGoesBelowMeanFullTime,
    this.FullSD,
    this.avgInitToFullTime,
    this.numberOfTimesInitToFullTimeGoesAboveMeanInitToFullTime,
    this.status,
    this.timeLeftOnCurrentState,
  });

  factory LogData.fromJson(Map<String, dynamic> json) {
    return LogData(
      nbrID: json['nbrID'] ?? "-",
      routerID: json['routerID'] ?? "-",
      areaID: json['areaID'] ?? "-",
      IPversion: json['IPversion'] ?? "-",
      DownAvg: json['DownAvg'] ?? 0.0,
      FullAvg: json['FullAvg'] ?? 0.0,
      numberOfTimesFullTimeGoesBelowMeanFullTime:
          json['numberOfTimesFullTimeGoesBelowMeanFullTime'], //?? 0,
      //No. of times full val goes below mean val
      FullSD: json['FullSD'], //?? -1, // std deviation
      avgInitToFullTime: json['avgInitToFullTime'], //Avg Init to full time
      numberOfTimesInitToFullTimeGoesAboveMeanInitToFullTime:
          json['numberOfTimesInitToFullTimeGoesAboveMeanInitToFullTime'], //?? 0,
      currentState: json['currentcurrentState'] ?? "-",
      currentDateAndTime: json['currentDateAndTime'] ?? "-",
      status: json['status'] ?? "-",
      timeLeftOnCurrentState: json['timeLeftOnCurrentState'],
      event: json['event'] ?? "-",
      timePassedOnCurrentState: json['timePassedOnCurrentState'] ?? 0.0,
    );
  }
}
