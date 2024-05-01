class ListKabarUdangModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  ListKabarUdangModel({this.data, this.links, this.meta});

  ListKabarUdangModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? authorId;
  int? categoryId;
  String? image;
  String? status;
  bool? featured;
  Null? advertisement;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? seoTitle;
  String? excerpt;
  String? body;
  String? slug;
  String? metaDescription;
  String? metaKeywords;

  Data(
      {this.id,
      this.authorId,
      this.categoryId,
      this.image,
      this.status,
      this.featured,
      this.advertisement,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.seoTitle,
      this.excerpt,
      this.body,
      this.slug,
      this.metaDescription,
      this.metaKeywords});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorId = json['author_id'];
    categoryId = json['category_id'];
    image = json['image'];
    status = json['status'];
    featured = json['featured'];
    advertisement = json['advertisement'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    seoTitle = json['seo_title'];
    excerpt = json['excerpt'];
    body = json['body'];
    slug = json['slug'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['author_id'] = this.authorId;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['advertisement'] = this.advertisement;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title'] = this.title;
    data['seo_title'] = this.seoTitle;
    data['excerpt'] = this.excerpt;
    data['body'] = this.body;
    data['slug'] = this.slug;
    data['meta_description'] = this.metaDescription;
    data['meta_keywords'] = this.metaKeywords;
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
  String? perPage;
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
