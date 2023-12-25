import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/UI/calculators.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/account.dart';
import 'package:zenfit/UI/loginPage.dart';
import 'package:zenfit/UI/welcome.dart';
import 'package:zenfit/UI/exercise.dart';
import 'package:zenfit/UI/startWorkout.dart';

class Settings extends StatefulWidget{
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  bool isCardVisible= false;

  void navigateTostartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => startWorkout()),
    );
  }
  @override
  Widget build (BuildContext context) {
    return GestureDetector(
      onTap: () { setState(() {isCardVisible = false;
      });
      },
      child: Scaffold(
        backgroundColor: Color(0xff37393D),
        appBar: AppBar(
          title: const Text(
              "Settings",
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
                title: Text("Account"),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Account()),
                  );
                }
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Calculators"),
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Calculators()),
                  );
                }
              ),
            ),
            Card(
              child: ListTile(
                title: Text("3"),
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Exercise()),
                    );
                  }
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Log out"),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  welcomePage()),
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
                Navigator.of(context).popUntil((route) => route.isFirst);
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