import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zenfit/UI/all%20calculators/calorieCalculator.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/all%20calculators/1rmCalculator.dart';
import 'package:zenfit/UI/startWorkout.dart';

class Calculators extends StatefulWidget {
  const Calculators({super.key});

  @override
  State<Calculators> createState() => _CalculatorsState();
}

class _CalculatorsState extends State<Calculators> {
  bool isCardVisible= false;

  void navigateTostartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => startWorkout(workouttime: DateTime.now().millisecondsSinceEpoch.toString(),)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { setState(() {isCardVisible = false;
      });
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
              "Calculators",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back),color: Colors.white),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            children:  [
             /* Card(
                color: Colors.blueGrey,
                child: ListTile(
                    textColor: Colors.white,
                    title: const Text("Calorie Calculator"),
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Calorie_Calculator()),
                      );
                    }
                ),
              ),

              Card(
                color: Colors.blueGrey,
                child: ListTile(
                    textColor: Colors.white,
                    title: const Text("1RM Calculator"),
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RM_Calculator()),
                      );
                    }
                ),
              ),*/

              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Calorie_Calculator()),
                    );


                  },

                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(

                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.calculate_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Expanded(child:Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Calorie Calculator",
                              style: TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.w900,
                                //fontStyle: FontStyle.italic,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 5),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),



              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const RM_Calculator()),
                    );


                  },

                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(

                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.calculate_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Expanded(child:Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "1RM Calculator",
                              style: TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.w900,
                                //fontStyle: FontStyle.italic,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 5),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),









            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shadowColor: Colors.black,
          surfaceTintColor: Colors.black,
          elevation: 20,
          height: 60,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }, icon: const Icon(Icons.home,color: Colors.white)),
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Graph()),
                );

              }, icon: const Icon(Icons.show_chart,color: Colors.white)),
              IconButton(onPressed:(){
                setState(() {
                  isCardVisible = !isCardVisible;
                });
              }, icon: const Icon(Icons.add_circle_outlined,color: Colors.white)),
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TrainingProgram()),
                );

              }, icon: const Icon(Icons.note_alt,color: Colors.white)),
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const settings()),
                );
              }, icon: const Icon(Icons.settings,color: Colors.white)),

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
