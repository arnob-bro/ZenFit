import 'package:flutter/material.dart';
import 'package:zenfit/Exercise%20List/exercise_list.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercise.dart';




import 'package:flutter/material.dart';

class Shoulders extends StatefulWidget {
  final String category;
  const Shoulders({super.key, required this.category});

  @override
  State<Shoulders> createState() => _ShouldersState();
}

class _ShouldersState extends State<Shoulders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff37393D),
        body: SafeArea(
          child: ListView.builder(
              itemCount: shoulde.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.white10,
                  child: ListTile(
                      title: Text(shoulde[index],style: const TextStyle(color: Colors.white54),),
                      onTap: (){

                      }
                  ),
                );
              }
          )
        )




    );
  }
}
