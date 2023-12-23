import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercise.dart';

class Abs extends StatefulWidget {
  const Abs({super.key});

  @override
  State<Abs> createState() => _AbsState();
}

class _AbsState extends State<Abs> {
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
                  title: const Text("Cable Crunch",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),

            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Crunch",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Hanging Knee Raise",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Hanging Leg Raise",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Hanging Sit-Up",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Horizontal Wood Chop With Cable",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Lying Leg Raise",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Machine Crunch",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Mountain Climbers",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Oblique Crunch",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Oblique Sit-Up",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Plank",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Russian Twist",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Side Plank",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Sit-Up",style: TextStyle(color: Colors.white54),),
                  onTap: (){

                  }
              ),
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                  title: const Text("Vacuum Training",style: TextStyle(color: Colors.white54),),
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
