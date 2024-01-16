import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zenfit/UI/account.dart';
import 'package:zenfit/UI/body_measurement.dart';
import 'package:zenfit/UI/followedPrograms.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/myGoals.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/startWorkout.dart';
import 'package:zenfit/UI/trainingProgram.dart';

import 'Chat_Room.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  bool isCardVisible= false;
  final AssetImage backgroundImage = AssetImage('assets/images/traininglogpic.jpg');



  void navigateTostartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const startWorkout()),
    );
  }
  @override
  Widget build (BuildContext context){
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isCardVisible = false;
          });
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(23, 23, 23, 9),
          appBar: AppBar(
            backgroundColor: Colors.black12,

            actions: [
              IconButton(onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Body_Measurement()),
                );
              },
                icon: const Icon(Icons.accessibility_sharp),
                color: Colors.white54,
              )

            ],
            leading: IconButton(onPressed:(){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Account()),
              );

            },
              icon: const Icon(Icons.person_sharp),
              color: Colors.white54,
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [

                    Padding(
                      padding: EdgeInsets.only(left: 20,top: 10),
                      child: Text(
                        "Training Log",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),

                    Row(
                      children: [
                        Expanded(

                          child: GestureDetector(
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRect(
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: Image.asset(
                                            'assets/images/chatroombg.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white70,
                                            size: 30,
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 3,
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white70,
                                            size: 30,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 1,
                                            height:MediaQuery.of(context).size.width * 0.15 ,

                                            color: Colors.black.withOpacity(0.7), // Adjust the opacity as needed
                                            child: Center(
                                              child: Text(
                                                "Elevate your fitness journey with our Training Log feature – the ultimate companion for tracking progress, achieving milestones, and unlocking your full potential.",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //child: const Center(child: Text("Chat Room")),
                            ),
                            onTap: (){ },

                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20,top: 30),
                      child: Text(
                        "My Goals",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRect(
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: Image.asset(
                                            'assets/images/mygoalsbg.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white70,
                                            size: 30,
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 3,
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white70,
                                            size: 30,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 1,
                                            height:MediaQuery.of(context).size.width * 0.15 ,

                                            color: Colors.black.withOpacity(0.6), // Adjust the opacity as needed
                                            child: Center(
                                              child: Text(
                                                "Empower your journey, set milestones, and conquer your aspirations with 'My Goals' – your personalized roadmap to a healthier, stronger you.",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //child: const Center(child: Text("Chat Room")),
                            ),
                            onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => My_Goals()),
                              );
                            },
                          ),
                        ),

                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20,top: 30),
                      child: Text(
                        "Followed Programs",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(

                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRect(
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: Image.asset(
                                              'assets/images/followedprogramsbg.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black87,
                                              size: 30,
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 3,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black87,
                                              size: 30,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 1,
                                              height:MediaQuery.of(context).size.width * 0.15 ,

                                              color: Colors.black.withOpacity(0.6), // Adjust the opacity as needed
                                              child: Center(
                                                child: Text(
                                                  "Seamlessly sculpt your fitness journey with Followed Programs – personalized, guided routines tailored to your goals, ensuring every step leads you closer to success",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //child: const Center(child: Text("Chat Room")),
                              ),
                              onTap: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const Followed_Programs()),
                                );
                              }
                          ),
                        ),


                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20,top: 30),
                      child: Text(
                        "Chat Room",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                                child: ClipRect(
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: Image.asset(
                                              'assets/images/chatroom.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black54,
                                              size: 30,
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 3,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black54,
                                              size: 30,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 1,
                                              height:MediaQuery.of(context).size.width * 0.15 ,

                                              color: Colors.black.withOpacity(0.6), // Adjust the opacity as needed
                                              child: Center(
                                                child: Text(
                                                  "Fuel your fitness journey in our chat room – connect, motivate, and conquer goals with our supportive community.",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //child: const Center(child: Text("Chat Room")),
                            ),
                            onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const Chat_Room()),
                              );
                            },
                          ),
                        ),

                      ],
                    )




                  ],
                ),
              ),
            ),
          ),






          /*body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children:  [
                      SizedBox(height: 100,),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(

                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      //color: Color.fromRGBO(88, 86, 98, 8),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 200,
                                  child: const Center(child: Text("Training Log")),
                                ),
                              ),
                              onTap: (){ },

                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  height: 200,
                                  child: const Center(child: Text("My Goals")),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => My_Goals()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(

                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    //color: Color.fromRGBO(88, 86, 98, 8),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 200,
                                  child: const Center(child: Text("Followed Programs")),
                                ),
                              ),
                                onTap: (){
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const Followed_Programs()),
                                  );
                                }
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  height: 200,
                                  child: const Center(child: Text("Chat Room")),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const Chat_Room()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),


            */
          bottomNavigationBar: BottomAppBar(
            elevation: 20,
            height: 60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed:(){

                }, icon: const Icon(Icons.home)),
                IconButton(onPressed:(){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Graph()),
                  );

                }, icon: const Icon(Icons.show_chart)),
                IconButton(onPressed:(){
                  setState(() {
                    isCardVisible = true;
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
                  color: Colors.grey,
                  child: Center(
                    child: Card(

                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isCardVisible =false;
                            navigateTostartWorkout();
                          });
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
      ),
    );
  }
}