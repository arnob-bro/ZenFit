import 'package:flutter/material.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercises%20list/Abs.dart';
import 'package:zenfit/UI/exercises%20list/Back.dart';
import 'package:zenfit/UI/exercises%20list/Biceps.dart';
import 'package:zenfit/UI/exercises%20list/Chest.dart';
import 'package:zenfit/UI/exercises%20list/Forearms.dart';
import 'package:zenfit/UI/exercises%20list/Glutes.dart';
import 'package:zenfit/UI/exercises%20list/Hamstrings.dart';
import 'package:zenfit/UI/exercises%20list/LowerLegs.dart';
import 'package:zenfit/UI/exercises%20list/Quads.dart';
import 'package:zenfit/UI/exercises%20list/Shoulders.dart';
import 'package:zenfit/UI/exercises%20list/Triceps.dart';
import 'package:zenfit/UI/exercises%20list/Cardio.dart';


class Exercise extends StatefulWidget {
  final String category;
  const Exercise({super.key, required this.category});

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
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back),color: Colors.white),
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

      body: TabBarView(
        children: [
          Abs(category: widget.category,),
          Back(category: widget.category,),
          Biceps(category: widget.category,),
          Chest(category: widget.category,),
          Forearms(category: widget.category,),
          Glutes(category: widget.category,),
          Hamstrings(category: widget.category,),
          LowerLegs(category: widget.category,),
          Quads(category: widget.category,),
          Shoulders(category: widget.category,),
          Triceps(category: widget.category,),
          const Cardio(),
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
