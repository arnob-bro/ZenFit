import 'package:flutter/material.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/graph.dart';


class TrainingProgram extends StatefulWidget {
  const TrainingProgram({super.key});

  @override
  State<TrainingProgram> createState() => _TrainingProgramState();
}

class _TrainingProgramState extends State<TrainingProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text("Training Programs"),
        backgroundColor: Colors.black26,

      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text("Mine"),
              onTap: () {

              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Programs"),
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
