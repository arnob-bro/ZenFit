import 'package:flutter/material.dart';
import 'package:zenfit/UI/account.dart';
import 'package:zenfit/UI/body_measurement.dart';
import 'package:zenfit/UI/followedPrograms.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/myGoals.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/startWorkout.dart';
import 'package:zenfit/UI/trainingProgram.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  bool isCardVisible= false;

  void navigateTostartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => startWorkout()),
    );
  }
  @override
  Widget build (BuildContext context){
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () { setState(() {isCardVisible = false;
        });
        },
        child: Scaffold(
            backgroundColor: const Color(0xff37393D),
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
            body: SafeArea(
              child: ListView(
                children:  [
                  Card(
                    child: ListTile(
                      title: const Text("Training Log"),
                      onTap: (){
        
                      }
                    ),
                  ),
        
                  Card(
                    child: ListTile(
                      title: const Text("My Goals"),
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => My_Goals()),
                          );
                        }
                    ),
                  ),
        
                  Card(
                    child: ListTile(
                      title: const Text("Followed Programs"),
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Followed_Programs()),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
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
                      MaterialPageRoute(builder: (context) => const Settings()),
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
              Container(
                height: 120,
                color: Colors.grey,
                child: Center(
                  child: Card(

                    child: InkWell(
                      onTap: () {
                        print("tapped");
                        navigateTostartWorkout();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
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
            ],
          )
              : null,
        ),
      ),
    );
  }
}