import 'package:flutter/material.dart';
import 'package:zenfit/homepage.dart';
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
        backgroundColor: Colors.black26,
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text("Calculators"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Calculators"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Calculators"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Calculators"),
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

            }, icon: const Icon(Icons.show_chart)),
            IconButton(onPressed:(){

            }, icon: const Icon(Icons.add_circle_outlined)),
            IconButton(onPressed:(){

            }, icon: const Icon(Icons.note_alt)),
            IconButton(onPressed:(){

            }, icon: const Icon(Icons.settings)),

          ],
        ),
      ),
    );
  }
}