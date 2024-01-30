import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/mine.dart';
import 'package:zenfit/UI/programs.dart';
import 'package:zenfit/UI/startWorkout.dart';


class TrainingProgram extends StatefulWidget {
  const TrainingProgram({super.key});

  @override
  State<TrainingProgram> createState() => _TrainingProgramState();
}

class _TrainingProgramState extends State<TrainingProgram> {
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
        backgroundColor: Color(0xff37393D),
        appBar: AppBar(
          title: const Text(
              "Training Programs",
            style: TextStyle(
              color: Colors.white54,
            ),
          ),
          backgroundColor: Colors.black12,
      
        ),
        body: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text("Mine"),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Mine()),
                  );
      
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Programs"),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Programs()),
                  );
      
                },
              ),
            ),
      
      
          ],
        ),
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
                color: Colors.transparent,
                child: Center(
                  child: Card(
                    color: Color.fromRGBO(250, 95, 95, 5),
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
