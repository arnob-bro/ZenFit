import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:zenfit/Model/Goal.dart';
import 'package:zenfit/Model/message.dart';
import 'package:zenfit/Model/user.dart';

import '../Model/body.dart';
import '../Model/zenfit_user.dart';

class DatabaseService{
  final CollectionReference userInfoCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference goalCollection = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).collection("goals");
  final CollectionReference bodyMeasurementCollection = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).collection('body measurements');
  final FirebaseStorage storage = FirebaseStorage.instance;
  User get user => FirebaseAuth.instance.currentUser!;

  Future collectUserInfo ({required String name,required String username,required bool isOnline, required String birthDate, required String gender, required String email, required String pass, required String image, required String about, required String createdAt, required String lastActive, required String pushToken}) async {
    final docUserInfo = userInfoCollection.doc(FirebaseAuth.instance.currentUser?.uid);
    final zenfituser = ZenFitUser(
      id: docUserInfo.id,
      name: name,
      username: username,
      birthDate: birthDate,
      gender: gender,
      email: email,
      pass:pass,
      isOnline: isOnline,
      image: FirebaseAuth.instance.currentUser!.photoURL.toString(),
      about: about,
      createdAt: createdAt,
      lastActive: lastActive,
      pushToken: '',
    );

    return await userInfoCollection.doc(FirebaseAuth.instance.currentUser?.uid).set(zenfituser.toJson());
  }

  Future<void> createGoal ({required String date, required String name,required String description}) async {
    final my_Goal = goalCollection.doc(name);
    final Goal goal = Goal(
      date: date,
      name: name,
      description: description
    );

    final jsonGoal = goal.toJson();
    return await my_Goal.set(jsonGoal);
  }

  Future<void> writeBodyMeasurements({required double neck,required double shoulders,required double leftUpperArm,required double rightUpperArm,required double leftForearm,required double rightForearm,required double leftThigh,required double rightThigh,required double leftCalf,required double rightCalf,required double bodyWeight,required double chest,required double waist,required double hips,required String date }) async{
    final mybody = bodyMeasurementCollection.doc(date);
    final Body body = Body(
      neck : neck,
      shoulders : shoulders,
      leftUpperArm : leftUpperArm,
      rightUpperArm : rightUpperArm,
      leftForearm : leftForearm,
      rightForearm : rightForearm,
      leftThigh : leftThigh,
      rightThigh : rightThigh,
      leftCalf : leftCalf,
      rightCalf : rightCalf,
      bodyWeight : bodyWeight,
      chest : chest,
      waist : waist,
      hips : hips,
      date : date
    );
    final jsonMyBody = body.toJson();
    return await mybody.set(jsonMyBody);
}



//read goals from database
  Stream <QuerySnapshot>readGoals(){
    return goalCollection.snapshots();
  }

  //read userInfo from database
  CollectionReference readUserInfo(){
      return userInfoCollection;
  }
  Future<ZenFitUser>readSelfInfo()async{
    return ZenFitUser.fromJson(await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).get() as Map<String, dynamic>);
  }

  //get all users for chatroom
  Stream<QuerySnapshot<Map<String, dynamic>>>getAllUsers(){
    return FirebaseFirestore.instance.collection('users').where('id', isNotEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots();
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

  Future updateAccountDetails(ZenFitUser zenfituser) async{
    final docUser = userInfoCollection.doc(FirebaseAuth.instance.currentUser?.uid);
    return await docUser.update({

      'about' : zenfituser.about,
      'name' : zenfituser.name,
      'birthDate' : zenfituser.birthDate,
      'gender' : zenfituser.gender,
      'username' : zenfituser.username
    });
  }

  Future<void>updateProfilePicture(File file)async{
    final ext = file.path.split('.').last;
    print('Extension : $ext');
    final ref = storage.ref().child('profile_pictures/${FirebaseAuth.instance.currentUser?.uid}.$ext');
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((pO){
          print('Dta Transferred: ${pO.bytesTransferred / 1000} kb');
    });

    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
      'image' : await ref.getDownloadURL()
    });

  }


  // Delete Goal
  Future deleteGoal(String goalName) async{
    final docGoal = goalCollection.doc(goalName);
    return await docGoal.delete();
  }

  ///****************** Chat Screen Related APIs************************

  //chatroom (collection) --> conversation_id (doc) --> messages (collection) --> message (doc)

  //useful for getting conversation id
  String getConversationID(String id) => user.uid.hashCode <= id.hashCode
      ? '${user.uid}_$id'
      : '${id}_${user.uid}';

  //for getting all messages of a specific conversation from firestore database
  Stream<QuerySnapshot<Map<String, dynamic>>>getAllmessages(ZenFitUser user){
    return FirebaseFirestore.instance.collection('chatroom').doc(getConversationID(user.id)).collection('messages')
        .snapshots();
  }

  // for sending message
  Future<void> sendMessage(ZenFitUser chatUser, String msg) async {

    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Message message = Message(
        msg: msg,
        read: '',
        toId: chatUser.id,
        //type: Type.text,
        type: 'text',
        fromId: user.uid,
        sent: time
    );

    final ref = FirebaseFirestore.instance.collection('chatroom').doc(getConversationID(chatUser.id)).collection('messages');
    await ref.doc(time).set(message.toJson());

  }

  //Update read status of message
  Future<void> updateMessageReadStatus(Message message) async {
    await FirebaseFirestore.instance
        .collection('chatroom/${getConversationID(message.fromId)}/messages/')
        .doc(message.sent)
        .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  }

  //get only last message of a specific chat
  Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(ZenFitUser user){
    return FirebaseFirestore.instance
        .collection('chatroom/${getConversationID(user.id)}/messages/')
        .orderBy('sent',descending: true)
        .limit(1)
        .snapshots();
  }

}


