import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercise.dart';


import 'package:flutter/material.dart';

import '../../Exercise List/exercise_list.dart';

class Triceps extends StatefulWidget {
  final String category;
  const Triceps({super.key, required this.category});

  @override
  State<Triceps> createState() => _TricepsState();
}

class _TricepsState extends State<Triceps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff37393D),
        body: SafeArea(
          child: ListView.builder(
              itemCount: tricep.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.white10,
                  child: ListTile(
                      title: Text(tricep[index],style: const TextStyle(color: Colors.white54),),
                      onTap: ()async{
                        if(widget.category == 'mine'){

                        }

                      }
                  ),
                );
              }
          )
        )




    );
  }
}
