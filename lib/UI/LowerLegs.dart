import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercise.dart';



import 'package:flutter/material.dart';

class LowerLegs extends StatefulWidget {
  const LowerLegs({super.key});

  @override
  State<LowerLegs> createState() => _LowerLegsState();
}

class _LowerLegsState extends State<LowerLegs> {
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
                    title: const Text("Seated Calf Raise",style: TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              ),
              Card(
                color: Colors.white10,
                child: ListTile(
                    title: const Text("Standing Calf Raise",style: TextStyle(color: Colors.white54),),
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
