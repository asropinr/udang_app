class ListRegionModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  ListRegionModel({this.data, this.links, this.meta});

  ListRegionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  int? type;
  String? latitude;
  String? longitude;
  String? countryId;
  String? countryName;
  String? countryNameUppercase;
  String? provinceId;
  String? provinceName;
  String? regencyId;
  String? regencyName;
  String? districtId;
  String? districtName;
  String? villageId;
  String? villageName;
  String? fullName;
  String? nameTranslated;
  String? countryNameTranslated;
  String? countryNameTranslatedUppercase;

  Data(
      {this.id,
      this.name,
      this.type,
      this.latitude,
      this.longitude,
      this.countryId,
      this.countryName,
      this.countryNameUppercase,
      this.provinceId,
      this.provinceName,
      this.regencyId,
      this.regencyName,
      this.districtId,
      this.districtName,
      this.villageId,
      this.villageName,
      this.fullName,
      this.nameTranslated,
      this.countryNameTranslated,
      this.countryNameTranslatedUppercase});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryNameUppercase = json['country_name_uppercase'];
    provinceId = json['province_id'];
    provinceName = json['province_name'];
    regencyId = json['regency_id'];
    regencyName = json['regency_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    villageId = json['village_id'];
    villageName = json['village_name'];
    fullName = json['full_name'];
    nameTranslated = json['name_translated'];
    countryNameTranslated = json['country_name_translated'];
    countryNameTranslatedUppercase = json['country_name_translated_uppercase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['country_name_uppercase'] = this.countryNameUppercase;
    data['province_id'] = this.provinceId;
    data['province_name'] = this.provinceName;
    data['regency_id'] = this.regencyId;
    data['regency_name'] = this.regencyName;
    data['district_id'] = this.districtId;
    data['district_name'] = this.districtName;
    data['village_id'] = this.villageId;
    data['village_name'] = this.villageName;
    data['full_name'] = this.fullName;
    data['name_translated'] = this.nameTranslated;
    data['country_name_translated'] = this.countryNameTranslated;
    data['country_name_translated_uppercase'] =
        this.countryNameTranslatedUppercase;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
