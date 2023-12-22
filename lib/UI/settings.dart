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

class Settings extends StatefulWidget{
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
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
    );
  }
}