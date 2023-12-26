import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zenfit/Model/user.dart';

class DatabaseService{
  final CollectionReference userInfoCollection = FirebaseFirestore.instance.collection("users");

  Future collectUserInfo ({required String name,required String username, required DateTime birthDate, required String gender, required String email, required String pass}) async {
    final docUserInfo = userInfoCollection.doc();
    final userInfo userInformation = userInfo(
      id: docUserInfo.id,
      name: name,
      username: username,
      birthDate: birthDate,
      gender: gender,
      email: email,
      pass:pass
    );

    final jsonUserInfo = userInformation.toJson();
    return await docUserInfo.set(jsonUserInfo);
  }
}