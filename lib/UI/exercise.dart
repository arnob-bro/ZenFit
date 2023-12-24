import 'package:flutter/material.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/Abs.dart';
import 'package:zenfit/UI/Back.dart';
import 'package:zenfit/UI/Biceps.dart';
import 'package:zenfit/UI/Chest.dart';
import 'package:zenfit/UI/Forearms.dart';
import 'package:zenfit/UI/Glutes.dart';
import 'package:zenfit/UI/Hamstrings.dart';
import 'package:zenfit/UI/LowerLegs.dart';
import 'package:zenfit/UI/Quads.dart';
import 'package:zenfit/UI/Shoulders.dart';
import 'package:zenfit/UI/Triceps.dart';
import 'package:zenfit/UI/Cardio.dart';


class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:12,
    child:Scaffold(
      backgroundColor: const Color(0xff37393D),
      appBar: AppBar(
        title: const Text(
          "Exercise",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black12,
        bottom:const TabBar(
          tabs: [
            Tab(child: Text("Abs")),
            Tab(child: Text("Back")),
            Tab(child: Text("Biceps")),
            Tab(child: Text("Chest")),
            Tab(child: Text("Forearms")),
            Tab(child: Text("Glutes")),
            Tab(child: Text("Hamstrings")),
            Tab(child: Text("Lower Legs")),
            Tab(child: Text("Quads")),
            Tab(child: Text("Shoulders")),
            Tab(child: Text("Triceps")),
            Tab(child: Text("Cardio")),
          ],
          isScrollable: true,

        )

      ),

      body: const TabBarView(
        children: [
          Abs(),
          Back(),
          Biceps(),
          Chest(),
          Forearms(),
          Glutes(),
          Hamstrings(),
          LowerLegs(),
          Quads(),
          Shoulders(),
          Triceps(),
          Cardio(),
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

    ),
    );
  }

}
