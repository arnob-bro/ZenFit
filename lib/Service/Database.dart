import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zenfit/Model/Goal.dart';
import 'package:zenfit/Model/user.dart';

class DatabaseService{
  final CollectionReference userInfoCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference goalCollection = FirebaseFirestore.instance.collection("users").doc(userInfo().id).collection("goals");

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

  Future createGoal ({required DateTime date, required String name,required String description}) async {
    final my_Goal = goalCollection.doc(name);
    final Goal goal = Goal(
      date: date,
      name: name,
      description: description
    );

    final jsonGoal = goal.toJson();
    return await my_Goal.set(jsonGoal);
  }



}