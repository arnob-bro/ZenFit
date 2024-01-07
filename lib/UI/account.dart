import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/startWorkout.dart';

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
      onTap: () { setState(() {isCardVisible = false;
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
        bottomNavigationBar: BottomAppBar(
          elevation: 20,
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }, icon: const Icon(Icons.home)),
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Graph()),
                );

              }, icon: const Icon(Icons.show_chart)),
              IconButton(onPressed:(){
                setState(() {
                  isCardVisible = !isCardVisible;
                });
              }, icon: const Icon(Icons.add_circle_outlined)),
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TrainingProgram()),
                );

              }, icon: const Icon(Icons.note_alt)),
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const settings()),
                );
              }, icon: const Icon(Icons.settings)),

            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: isCardVisible
            ? Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BackdropFilter( filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
              child: Container(
                height: 120,
                color: Colors.white,
                child: Center(
                  child: Card(
                    color: Colors.grey,

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
                              color: Colors.black, // Adjust the color as needed
                            ),
                            SizedBox(width: 10),
                            Text('Start a new workout', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.black),
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Profile Information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            const Divider(),
            const SizedBox(height: 5,),
        FutureBuilder<DocumentSnapshot>(
          future: DatabaseService().readUserInfo().doc(FirebaseAuth.instance.currentUser?.uid).get(),
          builder:
              (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting){
                  return const LinearProgressIndicator();
                }

            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            
            if(snapshot.data == null){
              return const Text("No data");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              //return Text("Full Name: ${data['name']}");
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name : ${data['name']}",style: const TextStyle(fontSize: 18),),
                  const SizedBox(height: 5,),
                  Text('Username : ${data['username']}',style: const TextStyle(fontSize: 18),),
                  const SizedBox(height: 5,),
                  Text('Birth Date : ${data['birthDate'].toString()}',style: const TextStyle(fontSize: 18),),
                  const SizedBox(height: 5,),
                  Text('Gender : ${data['gender']}',style: const TextStyle(fontSize: 18),),
                  const SizedBox(height: 5,),
                  Text('Email Account : ${data['email']}',style: const TextStyle(fontSize: 18),),
                  const SizedBox(height: 5,),
                  Text('UID : ${data['id']}',style: const TextStyle(fontSize: 18),),
                ],
              );
            }

            return const Text("loading");
          },
        )
          ],
        ),
      ),
    );
  }
}


