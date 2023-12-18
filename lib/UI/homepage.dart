import 'package:flutter/material.dart';
import 'package:zenfit/UI/account.dart';
import 'package:zenfit/UI/body_measurement.dart';
import 'package:zenfit/UI/followedPrograms.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/myGoals.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          actions: [
            IconButton(onPressed:(){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Body_Measurement()),
              );
            }, icon: const Icon(Icons.accessibility_rounded)),
          ],
          leading: IconButton(onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Account()),
            );

          }, icon: const Icon(Icons.person)),
        ),
        body: ListView(
          children:  [
            Card(
              child: ListTile(
                title: const Text("Training Log"),
                onTap: (){

                }
              ),
            ),

            Card(
              child: ListTile(
                title: const Text("My Goals"),
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => My_Goals()),
                    );
                  }
              ),
            ),

            Card(
              child: ListTile(
                title: const Text("Followed Programs"),
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Followed_Programs()),
                    );
                  }
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 20,
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed:(){

              }, icon: const Icon(Icons.home)),
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Graph()),
                );

              }, icon: const Icon(Icons.show_chart)),
              IconButton(onPressed:(){


              }, icon: const Icon(Icons.add_circle_outlined)),
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TrainingProgram()),
                );

              }, icon: const Icon(Icons.note_alt)),
              IconButton(onPressed:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              }, icon: const Icon(Icons.settings)),

            ],
          ),
        ),
    );
  }
}