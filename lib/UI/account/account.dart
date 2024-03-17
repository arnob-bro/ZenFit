import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/startWorkout.dart';
import 'package:zenfit/UI/account/update_account.dart';

import '../../main.dart';

class Account extends StatefulWidget{
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isCardVisible= false;


  @override
  Widget build (BuildContext context){
    return Scaffold(



        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
              "Account",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const AccountDetails(),


    );
  }
}

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(mq.height * .8),
                child: CachedNetworkImage(
                  width: mq.height * .15,
                  height: mq.height * .15,
                  fit: BoxFit.cover,
                  imageUrl: DatabaseService.me.image,
                  errorWidget: (context,url,error)=> const CircleAvatar(child: Icon(CupertinoIcons.person),),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(child: Text("Profile Information",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),),
            const Divider(),
            const SizedBox(height: 5,),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Name :',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(DatabaseService.me.name,style: const TextStyle(fontSize: 18),),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Username : ',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("@${DatabaseService.me.username}",style: const TextStyle(fontSize: 18),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Birth Date : ',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(DatabaseService.me.birthDate.toString(),style: const TextStyle(fontSize: 18),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Gender : ',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(DatabaseService.me.gender,style: const TextStyle(fontSize: 18),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Email Account : ',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title:  Text(DatabaseService.me.email,style: const TextStyle(fontSize: 18),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'User ID : ',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(DatabaseService.me.id,style: const TextStyle(fontSize: 18),),
              ),
            ),
            const SizedBox(height: 10,),

            Center(
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const UpdateAccount()));

                  },
                  height: 30,
                  color: Colors.lightBlue,
                  shape: const StadiumBorder(),
                  child:const Text("Click to update") ,
                )
            )





          ],
        )
      ),
    );
  }
}


