class RadioModel {
  RadioModel({
      this.radios,});

  RadioModel.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(RadiosItemModel.fromJson(v));
      });
    }
  }
  List<RadiosItemModel>? radios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (radios != null) {
      map['radios'] = radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class RadiosItemModel {
  RadiosItemModel({
      this.id, 
      this.name, 
      this.url, 
      this.recentDate,});

  RadiosItemModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }
  num? id;
  String? name;
  String? url;
  String? recentDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    map['recent_date'] = recentDate;
    return map;
  }

}