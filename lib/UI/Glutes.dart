import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercise.dart';




import 'package:flutter/material.dart';

class Glutes extends StatefulWidget {
  const Glutes({super.key});

  @override
  State<Glutes> createState() => _GlutesState();
}

class _GlutesState extends State<Glutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff37393D),
        body: SafeArea(
          child: ListView(
            children:  [
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Barbell Lunge",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Barbell Walking Lunges",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Cable Glute Kickback",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Dumbbell Lunge",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Dumbbell Walking Lunge",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Dumbbell Romanian Deadlift",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Glute Bridge",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Hip Adbuction With Machine",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Hip Thrust",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Hip Thrust Machine",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Machine Glute Kickback",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Romanian Deadlift",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),


            ],
          ),
        )




    );
  }
}
