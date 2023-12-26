import 'package:flutter/material.dart';
import 'package:zenfit/UI/ArnoldsBasicMassRoutine.dart';
import 'package:zenfit/UI/Bodybuilding313.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/startWorkout.dart';
import 'package:zenfit/UI/ArnoldsBasicMassRoutine.dart';




class Programs extends StatefulWidget {
  const Programs({super.key});

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
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
          title: const Text(
              "Programs",
            style: TextStyle(
              color: Colors.white54,
            ),
          ),
          backgroundColor: Colors.black12,

        ),
        body: ListView(
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Arnold's Basic Mass Routine",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white54,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            Card(
              child: ListTile(
                  title: Text("6 days/weeks"),
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ArnoldsBasicMassRoutine()),
                    );

                  }
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Bodybuilding 313",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white54,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            Card(
              child: ListTile(
                  title: Text("5-6 days/week"),
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const BodyBuilding313()),
                    );
                  }
              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Bodybuilding Ballet",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white54,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            Card(
              child: ListTile(
                  title: Text("6 days/week"),
                  onTap: (){

                  }
              ),
            ),
            Card(
              child: ListTile(
                  title: Text("4 days/week"),
                  onTap: (){

                  }
              ),
            ),
            Card(
              child: ListTile(
                  title: Text("5 days/week"),
                  onTap: (){

                  }
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Bodybuilding Blitz",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white54,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            Card(
              child: ListTile(
                  title: Text("5 days/week"),
                  onTap: (){

                  }
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Bodybuilding for Bigginers",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white54,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            Card(
              child: ListTile(
                  title: Text("3 days/week"),
                  onTap: (){

                  }
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Full Body",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white54,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            Card(
              child: ListTile(
                  title: Text("2 days/week"),
                  onTap: (){

                  }
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "German Volume Training",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white54,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            Card(
              child: ListTile(
                  title: Text("3 days/week"),
                  onTap: (){

                  }
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Push/Pull/Legs",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white54,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            Card(
              child: ListTile(
                  title: Text("Advanced,6 days/week"),
                  onTap: (){

                  }
              ),
            ),
            Card(
              child: ListTile(
                  title: Text("Intermediate,6 days/week"),
                  onTap: (){

                  }
              ),
            ),
            Card(
              child: ListTile(
                  title: Text("Intermediate,3 days/week"),
                  onTap: (){

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
