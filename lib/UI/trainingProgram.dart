import 'package:flutter/material.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/mine.dart';
import 'package:zenfit/UI/programs.dart';


class TrainingProgram extends StatefulWidget {
  const TrainingProgram({super.key});

  @override
  State<TrainingProgram> createState() => _TrainingProgramState();
}

class _TrainingProgramState extends State<TrainingProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
