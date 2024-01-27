import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:zenfit/Model/Goal.dart';
import 'package:zenfit/Model/message.dart';
import 'package:zenfit/Model/user.dart';

import '../Model/body.dart';
import '../Model/zenfit_user.dart';

class DatabaseService{
  static final CollectionReference userInfoCollection = FirebaseFirestore.instance.collection("users");
  static final CollectionReference goalCollection = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).collection("goals");
  static final CollectionReference bodyMeasurementCollection = FirebaseFirestore.instance.collection('bodymeasurement');
  static final FirebaseStorage storage = FirebaseStorage.instance;
  static User get user => FirebaseAuth.instance.currentUser!;
  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;
  static late ZenFitUser me;

  //collect user information
  static Future collectUserInfo ({required String name,required String username,required bool isOnline, required String birthDate, required String gender, required String email, required String pass, required String image, required String about, required String createdAt, required String lastActive, required String pushToken}) async {
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
      pushToken: pushToken,
    );

    return await userInfoCollection.doc(FirebaseAuth.instance.currentUser?.uid).set(zenfituser.toJson());
  }

  //create goal
  static Future<void> createGoal ({required String date, required String name,required String description}) async {
    final my_Goal = goalCollection.doc(name);
    final Goal goal = Goal(
      date: date,
      name: name,
      description: description
    );

    final jsonGoal = goal.toJson();
    return await my_Goal.set(jsonGoal);
  }

  //write body measurements
  static Future<void> writeBodyMeasurements({required double neck,required double shoulders,required double leftUpperArm,required double rightUpperArm,required double leftForearm,required double rightForearm,required double leftThigh,required double rightThigh,required double leftCalf,required double rightCalf,required double bodyWeight,required double chest,required double waist,required double hips,required String date }) async{
    final mybody = bodyMeasurementCollection.doc(user.uid).collection("time").doc(date);
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
  static Stream <QuerySnapshot>readGoals(){
    return goalCollection.snapshots();
  }

  //read userInfo from database
  static CollectionReference readUserInfo(){
      return userInfoCollection;
  }


  //get all users for chatroom
  static Stream<QuerySnapshot<Map<String, dynamic>>>getAllUsers(){
    return FirebaseFirestore.instance.collection('users').where('id', isNotEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots();
  }


  //getting self info
  static Future<void> getSelfInfo()async{
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get().then((user) {
      if(user.exists){
        me = ZenFitUser.fromJson(user.data()!);
        print('user self info has been copied into me');
      }else{
        print(' failed to copy user self info into me');
      }
    });
  }


  // Update documents from goal Collection
  static Future updateGoal(Goal goal) async{
    final docGoal = goalCollection.doc(goal.name);
    return await docGoal.update({
      'date': goal.date,
      'name': goal.name,
      'description': goal.description
    });
  }

  //update user account details
  static Future updateAccountDetails() async{
    final docUser = userInfoCollection.doc(user.uid);
    print("account has been updated");
    return await docUser.update({

      'about' : me.about,
      'name' : me.name,
      'birthDate' : me.birthDate,
      'gender' : me.gender,
      'username' : me.username
    });
  }

  //update profile pic of user
  static Future<void>updateProfilePicture(File file)async{
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

  //for getting specific user info
  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(ZenFitUser zenfituser){
    return FirebaseFirestore.instance
        .collection('users')
        .where('id', isNotEqualTo: zenfituser.id)
        .snapshots();
  }

  //update online or last active status of user
  static Future<void> updateActiveStatus(bool isOnline)async{
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'isOnline': isOnline, 'lastActive': DateTime.now().millisecondsSinceEpoch.toString(),/*'pushToken': getFirebaseMessagingToken()*/});
  }


  // Delete Goal
  static Future deleteGoal(String goalName) async{
    final docGoal = goalCollection.doc(goalName);
    return await docGoal.delete();
  }

  ///****************** Chat Screen Related APIs************************



  //useful for getting conversation id
  static String getConversationID(String id) => user.uid.hashCode <= id.hashCode
      ? '${user.uid}_$id'
      : '${id}_${user.uid}';

  //for getting all messages of a specific conversation from firestore database
  static Stream<QuerySnapshot<Map<String, dynamic>>>getAllmessages(ZenFitUser user){
    return FirebaseFirestore.instance
        .collection('chatroom')
        .doc(getConversationID(user.id))
        .collection('messages')
        .orderBy('sent',descending: true)
        .snapshots();
  }

  // for sending message
  static Future<void> sendMessage(ZenFitUser zenfituser, String msg, String type) async {

    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Message message = Message(
        msg: msg,
        read: '',
        toId: zenfituser.id,
        //type: Type.text,
        type: type,
        fromId: user.uid,
        sent: time
    );

    final ref = FirebaseFirestore.instance.collection('chatroom').doc(getConversationID(zenfituser.id)).collection('messages');
    await ref.doc(time).set(message.toJson()).then((value) => sendPushNotification(zenfituser,type == 'text' ? msg : 'image'));

  }

  //Update read status of message
  static Future<void> updateMessageReadStatus(Message message) async {
    await FirebaseFirestore.instance
        .collection('chatroom/${getConversationID(message.fromId)}/messages/')
        .doc(message.sent)
        .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  }

  //get only last message of a specific chat
  static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(ZenFitUser user){
    return FirebaseFirestore.instance
        .collection('chatroom/${getConversationID(user.id)}/messages/')
        .orderBy('sent',descending: true)
        .limit(1)
        .snapshots();
  }

  //delete message
  static Future<void> deleteMessage(Message message) async {
    await FirebaseFirestore.instance
        .collection('chatroom/${getConversationID(message.toId)}/messages/')
        .doc(message.sent)
        .delete();
    if(message.type == 'image') {
      storage.refFromURL(message.msg).delete();
    }
  }


  //send chat image
  static Future<void> sendChatImage(ZenFitUser zenfituser, File file) async {
    final ext = file.path.split('.').last;
    
    final ref = storage.ref()
        .child('images/${getConversationID(zenfituser.id)}/${DateTime.now().millisecondsSinceEpoch}.$ext');
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((pO){
      print('Data Transferred: ${pO.bytesTransferred / 1000} kb');
    });

    final imageUrl = await ref.getDownloadURL();
    await sendMessage(zenfituser, imageUrl, 'image');

  }

  //getting unique push token for users to send notifications
  static Future<void> getFirebaseMessagingToken()async{
    await fMessaging.requestPermission();

    fMessaging.getToken().then((t) async {
      if(t != null){
        //me.pushToken =t;
        print('Push Token: $t');
        FirebaseFirestore.instance.collection('users').doc(user.uid).update({'pushToken': t});
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }



  //for sending push notification
  static Future<void> sendPushNotification(ZenFitUser zenfituser , String msg)async{

    try{
      final body = {
        "to": zenfituser.pushToken,
        "notification": {
          "title": me.name ,
          "body": msg,
          "android_channel_id": "chats",
        },
        "data": {
          "click_action" : "FLUTTER_NOTIFICATION_CLICK",
        },
      };

      var response = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers : {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "key=AAAA5y2C0nI:APA91bGmBL4dq5hNgNBAiNwTqfpbLrg0wrGSOKM30HPnjAxrfzLgul8JvYPIrz2_qqRVQvQWpH6q9aE0xMMtZ641NCfS0BDK_Fat99eQUpyaZMMtHaCB4afaw-Q4x_Zx2TZunp19tMgx"
          },
        body: jsonEncode(body)
      );
      print("Response status: ${response.statusCode}");
      print("Response body : ${response.body}");
    } catch(e){
      print('\nsendPushNotificationE: $e');
    }
  }



}


