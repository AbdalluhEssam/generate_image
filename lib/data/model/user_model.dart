class UserModel {
  Image? image;
  String? sId;
  String? name;
  String? email;
  bool? verified;
  String? role;
  String? universityCode;
  Null? phone;
  Null? universityYear;
  List<String>? courses;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.image,
        this.sId,
        this.name,
        this.email,
        this.verified,
        this.role,
        this.universityCode,
        this.phone,
        this.universityYear,
        this.courses,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    verified = json['verified'];
    role = json['role'];
    universityCode = json['university_code'];
    phone = json['phone'];
    universityYear = json['university_year'];
    courses = json['courses'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['verified'] = this.verified;
    data['role'] = this.role;
    data['university_code'] = this.universityCode;
    data['phone'] = this.phone;
    data['university_year'] = this.universityYear;
    data['courses'] = this.courses;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Image {
  String? publicId;
  String? url;

  Image({this.publicId, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['public_id'] = this.publicId;
    data['url'] = this.url;
    return data;
  }
}
