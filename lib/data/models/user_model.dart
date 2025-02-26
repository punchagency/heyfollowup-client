class UserModel {
  String? sId;
  String? fullName;
  String? email;
  String? phoneNumber;
  bool? isVerified;
  bool? subscribed;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? stripeCustomerId;

  UserModel(
      {this.sId,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.isVerified,
        this.subscribed,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.stripeCustomerId});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['full_name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isVerified = json['isVerified'];
    subscribed = json['subscribed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    stripeCustomerId = json['stripeCustomerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['isVerified'] = this.isVerified;
    data['subscribed'] = this.subscribed;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['stripeCustomerId'] = this.stripeCustomerId;
    return data;
  }
}
