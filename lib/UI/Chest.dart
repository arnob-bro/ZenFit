import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercise.dart';

import 'package:flutter/material.dart';

class Chest extends StatefulWidget {
  const Chest({super.key});

  @override
  State<Chest> createState() => _ChestState();
}

class _ChestState extends State<Chest> {
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
                    title: Text("Bench Press",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Cable Chest Press",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Close Grip Push Up",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Decline Bench Press",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Dumbbell Chest Fly",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Dumbbell Chest Press",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Dumbbell Decline Chest Press",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Incline Bench Press",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Incline Dumbbell Press",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Incline Push Up",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Machine Chest Fly",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Machine Horizontal Chest Press",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Pec Deck Fly",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Pullover",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Push-Up",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Smith Machine Bench Press",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Smith Machine Incline Bench Press",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text("Standing Cable Chest Fly",style: TextStyle(color: Colors.white54),),
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
