import 'package:flutter/material.dart';
import 'package:zenfit/UI/calorieCalculator.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/1rmCalculator.dart';

class Calculators extends StatefulWidget {
  const Calculators({super.key});

  @override
  State<Calculators> createState() => _CalculatorsState();
}

class _CalculatorsState extends State<Calculators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff37393D),
      appBar: AppBar(
        title: Text(
            "Calculators",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black12,
      ),
      body: ListView(
        children:  [
          Card(
            child: ListTile(
                title: Text("Calorie Calculator"),
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Calorie_Calculator()),
                  );
                }
            ),
          ),

          Card(
            child: ListTile(
                title: Text("1RM Calculator"),
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RM_Calculator()),
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
