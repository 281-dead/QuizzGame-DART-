class HistoryObject {
  int? id;
  String? time;
  int? socau;
  int? diem;
  HistoryObject({this.id, this.time, this.socau, this.diem});

  HistoryObject.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    time = json["time"];
    socau = json["socau"];
    diem = json["diem"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["time"] = time;
    data["socau"] = socau;
    data["diem"] = diem;
    return data;
  }
}
