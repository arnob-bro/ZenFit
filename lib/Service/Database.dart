import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zenfit/Model/Goal.dart';
import 'package:zenfit/Model/user.dart';

class DatabaseService{
  final CollectionReference userInfoCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference goalCollection = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).collection("goals");

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
//new
  // Used to map snapshot into a list of Goal Object
  List<Goal> goalListFromSnapshot(QuerySnapshot snapshot){
    final goalList = snapshot.docs.map(
            (doc) => Goal(date: doc.get('date'), name: doc.get('name'), description: doc.get('description'))
    ).toList();
    return goalList;
  }

  //read documents from goals collection
  Stream<List<Goal>> readGoals(){
    return goalCollection.snapshots().map(goalListFromSnapshot);
  }

  //  Map snapshot into one Goal Object
  Goal goalObjectFromSnapshot(DocumentSnapshot snapshot){
    return Goal(date: snapshot.get('date'), name: snapshot.get('name'), description: snapshot.get('description'));
  }

  // Get goal by goal name
  Stream<Goal> getGoalByGoalName(String goalName){
    return goalCollection.doc(goalName).snapshots().map(goalObjectFromSnapshot);
  }

  // Update documents from goal Collection
  Future updateGoal(Goal goal) async{
    final docGoal = goalCollection.doc(goal.name);
    return await docGoal.update({
      'date': goal.date,
      'name': goal.name,
      'description': goal.description
    });
  }

  // Delete Goal
  Future deleteGoal(String goalName) async{
    final docGoal = goalCollection.doc(goalName);
    return await docGoal.delete();
  }



}


