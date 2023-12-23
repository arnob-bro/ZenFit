import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercise.dart';



import 'package:flutter/material.dart';

class Hamstrings extends StatefulWidget {
  const Hamstrings({super.key});

  @override
  State<Hamstrings> createState() => _HamstringsState();
}

class _HamstringsState extends State<Hamstrings> {
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
                    title: const Text("Bulgarian Split Squat",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Lying Leg Curl",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Lying Hamstring Machine",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Nordic Hamstring",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Seated Leg Curl",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Stiff-legged Deadlift",style: TextStyle(color: Colors.white54),),
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
