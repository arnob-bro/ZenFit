import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercise.dart';

class Cardio extends StatefulWidget {
  const Cardio({super.key});

  @override
  State<Cardio> createState() => _CardioState();
}

class _CardioState extends State<Cardio> {
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
                    title: const Text("Running",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Swimming",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Cycling",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Walking",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Rowing",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Cross Trainer",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Jump Rope",style: TextStyle(color: Colors.white54),),
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
