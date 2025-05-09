class UniqVals {
  final List<String>? nbrId;
  final List<String>? routerId;
  final List<String>? areaId;
  final List<String>? IPversion;

  UniqVals({this.nbrId, this.routerId, this.areaId, this.IPversion});

  factory UniqVals.fromJson(Map<String, dynamic> json) {
    return UniqVals(
      nbrId: json['nbrId'] ?? "Neighbour Id",
      routerId: json['routerId'] ?? "Router Id",
      areaId: json['areaId'] ?? "Area Id",
      IPversion: json['IPversion'] ?? "IP Version",
    );
  }
}
