import 'package:flutter/material.dart';
import 'package:zenfit/UI/createGoal.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';


class My_Goals extends StatefulWidget {
   My_Goals({super.key});
  bool noGoals = true;
  @override
  State<My_Goals> createState() => _My_GoalsState();
}

class _My_GoalsState extends State<My_Goals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff37393D),
      appBar: AppBar(
        title: const Text(
            "My Goals",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black12,
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => Create_Goal()),
          );
        },
        child: const Icon(Icons.add),

      ),
    );
  }
}
/*
class Show_Goals extends StatefulWidget {
  const Show_Goals({super.key});

  @override
  State<Show_Goals> createState() => _Show_GoalsState();
}

class _Show_GoalsState extends State<Show_Goals> {

  @override
  Widget build(BuildContext context) {
    return ListView(

    );
  }
}
*/
