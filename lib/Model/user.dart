class userInfo {
  String? id;
  String? name;
  String? username;
  String? birthDate;
  String? gender;
  String? email;
  String? pass;

  userInfo({this.id,this.name,this.username,this.birthDate,this.gender,this.email,this.pass});

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'birthDate': birthDate,
    'gender': gender,
    'email': email,
    'pass':pass
  };
  static userInfo fromJson(Map<String, dynamic> json) => userInfo(
    id: json['id'],
    name: json['name'],
    username: json['username'],
    birthDate: json['birthDate'],
    gender: json['gender'],
    email: json['email'],
    pass: json['pass']
  );



}