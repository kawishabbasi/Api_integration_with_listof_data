class expired_model {
  bool? error;
  List<Data>? data;
  Null? message;

  expired_model({this.error, this.data, this.message});

  expired_model.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? imagePath;
  String? adTitle;
  String? description;
  String? activeStatus;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? location;
  String? tags;

  Data(
      {this.id,
      this.userId,
      this.imagePath,
      this.adTitle,
      this.description,
      this.activeStatus,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.location,
      this.tags});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    imagePath = json['image_path'];
    adTitle = json['ad_title'];
    description = json['description'];
    activeStatus = json['active_status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    location = json['location'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['image_path'] = this.imagePath;
    data['ad_title'] = this.adTitle;
    data['description'] = this.description;
    data['active_status'] = this.activeStatus;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['location'] = this.location;
    data['tags'] = this.tags;
    return data;
  }
}
