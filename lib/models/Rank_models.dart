class UserRank {
  int? id;
  String? name;
  String? avatar;
  int? diem;

  UserRank({this.id, this.name, this.avatar, this.diem});

  UserRank.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    avatar = json["avatar"];
    diem = json["diem"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["avatar"] = avatar;
    data["diem"] = diem;
    return data;
  }
}
