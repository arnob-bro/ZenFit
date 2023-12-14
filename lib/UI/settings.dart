import 'package:flutter/material.dart';
import 'package:zenfit/UI/calculators.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/account.dart';

class Settings extends StatefulWidget{
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.black26,
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
            ),
          ),
          Card(
            child: ListTile(
              title: Text("4"),
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
              Navigator.of(context).popUntil((route) => route.isFirst);
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