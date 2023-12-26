class userInfo {
  String? id;
  String? name;
  String? username;
  DateTime? birthDate;
  String? gender;
  String? email;
  String? pass;

  userInfo({this.id= '',this.name,this.username,this.birthDate,this.gender,this.email,this.pass});

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'birthDate': birthDate,
    'gender': gender,
    'email': email,
    'pass':pass
  };



}