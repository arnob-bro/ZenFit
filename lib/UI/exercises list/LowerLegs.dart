import 'package:flutter/material.dart';
import 'package:zenfit/Exercise%20List/exercise_list.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercise.dart';



import 'package:flutter/material.dart';

class LowerLegs extends StatefulWidget {
  final String category;
  const LowerLegs({super.key, required this.category});

  @override
  State<LowerLegs> createState() => _LowerLegsState();
}

class _LowerLegsState extends State<LowerLegs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff37393D),
        body: SafeArea(
          child: ListView.builder(
              itemCount: lowerle.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.white10,
                  child: ListTile(
                      title: Text(lowerle[index],style: const TextStyle(color: Colors.white54),),
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
