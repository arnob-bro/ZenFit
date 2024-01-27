import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/startWorkout.dart';
import 'package:zenfit/UI/update_account.dart';

import '../main.dart';

class Account extends StatefulWidget{
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isCardVisible= false;

  void navigateTostartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const startWorkout()),
    );
  }
  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: () {
        setState(() {isCardVisible = false;
      });
      },
      child: Scaffold(



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

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: isCardVisible
            ? Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BackdropFilter( filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
              child: Container(
                height: 120,
                color: Colors.transparent,
                child: Center(
                  child: Card(
                    color: Color.fromRGBO(250, 95, 95, 5),
                    child: InkWell(
                      onTap: () {
                        navigateTostartWorkout();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fitness_center, // Choose the workout icon
                              size: 30.0,
                              color: Colors.white, // Adjust the color as needed
                            ),
                            SizedBox(width: 10),
                            Text('Start a new workout', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
            : null,
      ),
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


