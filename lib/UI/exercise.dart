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
            Tab(child: Text("Abs",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Back",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Biceps",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Chest",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Forearms",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Glutes",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Hamstrings",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Lower Legs",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Quads",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Shoulders",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Triceps",style: TextStyle(color: Colors.white54,),)),
            Tab(child: Text("Cardio",style: TextStyle(color: Colors.white54,),)),
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
                MaterialPageRoute(builder: (context) => const settings()),
              );
            }, icon: const Icon(Icons.settings)),
          ],
        ),
      ),

    ),
    );
  }

}
