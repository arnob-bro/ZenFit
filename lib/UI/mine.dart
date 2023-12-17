import 'package:flutter/material.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/addProgram.dart';



class Mine extends StatefulWidget {
  const Mine({super.key});

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text("Mine"),
        backgroundColor: Colors.black26,

      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text("Example1"),
              onTap: () {

              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Add Program"),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddProgram()),
                );

              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Example2"),
              onTap: () {

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
    );
  }
}
