import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/exercise.dart';


import 'package:flutter/material.dart';

import '../../Exercise List/exercise_list.dart';

class Forearms extends StatefulWidget {
  final String category;
  const Forearms({super.key, required this.category});

  @override
  State<Forearms> createState() => _ForearmsState();
}

class _ForearmsState extends State<Forearms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff37393D),
        body: SafeArea(
          child: ListView.builder(
              itemCount: fore.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.white10,
                  child: ListTile(
                      title: Text(fore[index],style: const TextStyle(color: Colors.white54),),
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
