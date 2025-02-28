class FollowUpModel {
  String? sId;
  String? userId;
  String? name;
  String? date;
  String? metWith;
  String? email;
  String? meetingLocation;
  String? randomFacts;
  String? linkedinUrl;
  String? image;
  String? nextSteps;
  String? schedule;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  int? iV;

  FollowUpModel(
      {this.sId,
        this.userId,
        this.name,
        this.date,
        this.metWith,
        this.email,
        this.meetingLocation,
        this.randomFacts,
        this.linkedinUrl,
        this.image,
        this.nextSteps,
        this.schedule,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt,
        this.iV});

  FollowUpModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    name = json['name'];
    date = json['date'];
    metWith = json['metWith'];
    email = json['email'];
    meetingLocation = json['meetingLocation'];
    randomFacts = json['randomFacts'];
    linkedinUrl = json['linkedinUrl'];
    image = json['image'];
    nextSteps = json['nextSteps'];
    schedule = json['schedule'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['date'] = this.date;
    data['metWith'] = this.metWith;
    data['email'] = this.email;
    data['meetingLocation'] = this.meetingLocation;
    data['randomFacts'] = this.randomFacts;
    data['linkedinUrl'] = this.linkedinUrl;
    data['image'] = this.image;
    data['nextSteps'] = this.nextSteps;
    data['schedule'] = this.schedule;
    data['phoneNumber'] = this.phoneNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
