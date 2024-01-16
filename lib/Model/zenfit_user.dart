class ZenFitUser {
  ZenFitUser({
    required this.image,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.isOnline,
    required this.email,
    required this.id,
    required this.lastActive,
    required this.pushToken,
    required this.pass,
    required this.birthDate,
    required this.gender,
    required this.username
  });
  late String image;
  late String about;
  late String name;
  late String createdAt;
  late bool isOnline;
  late String email;
  late String id;
  late String lastActive;
  late String pushToken;
  late String pass;
  late String? birthDate;
  late String? gender;
  late String? username;

  ZenFitUser.fromJson(Map<String, dynamic> json){
    image = json['image'] ?? '';
    about = json['about'] ?? '';
    name = json['name'] ?? '';
    createdAt = json['createdAt'] ?? '';
    isOnline = json['isOnline'] ?? '';
    email = json['email'] ?? '';
    id = json['id'] ?? '';
    lastActive = json['lastActive'] ?? '';
    pushToken = json['pushToken'] ?? '';
    pass = json['pass'] ?? '';
    birthDate = json['birthDate'] ?? '';
    gender = json['gender'] ?? '';
    username = json['username'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['about'] = about;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['isOnline'] = isOnline;
    data['email'] = email;
    data['id'] = id;
    data['lastActive'] = lastActive;
    data['pushToken'] = pushToken;
    data['pass'] = pass;
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    data['username'] = username;
    return data;
  }
}