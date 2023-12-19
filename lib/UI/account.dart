import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';

class Account extends StatefulWidget{
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build (BuildContext context){
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
              "Account",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const Username(),
      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed:(){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
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

class Username extends StatefulWidget{
  const Username({super.key});

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  @override
  Widget build (BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
              hintText: '(example: John Doe)',

            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Username",
              hintText: '(example: @john_doe)',
            ),
          ),
        ),
      ],
    );
  }
}