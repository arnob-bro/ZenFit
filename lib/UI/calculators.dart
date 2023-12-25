import 'package:flutter/material.dart';
import 'package:zenfit/UI/calorieCalculator.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/1rmCalculator.dart';
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
      MaterialPageRoute(builder: (context) => startWorkout()),
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
          title: Text(
              "Calculators",
            style: TextStyle(
              color: Colors.white54,
            ),
          ),
          backgroundColor: Colors.black12,
        ),
        body: ListView(
          children:  [
            Card(
              child: ListTile(
                  title: Text("Calorie Calculator"),
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Calorie_Calculator()),
                    );
                  }
              ),
            ),

            Card(
              child: ListTile(
                  title: Text("1RM Calculator"),
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const RM_Calculator()),
                    );
                  }
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
    );
  }
}
