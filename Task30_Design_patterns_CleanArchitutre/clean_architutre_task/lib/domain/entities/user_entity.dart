
class UserEntity {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? website;

  UserEntity({this.id, this.name, this.email, this.phone, this.website});

  UserEntity.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["website"] is String) {
      website = json["website"];
    }
  }

  static List<UserEntity> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserEntity.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["website"] = website;
    return _data;
  }
}