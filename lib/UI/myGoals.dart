import 'package:flutter/material.dart';
import 'package:zenfit/UI/createGoal.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';

import '../Model/Goal.dart';
import '../Service/Database.dart';


class My_Goals extends StatefulWidget {
   My_Goals({super.key});
  bool noGoals = true;
  @override
  State<My_Goals> createState() => _My_GoalsState();
}

class _My_GoalsState extends State<My_Goals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff37393D),
      appBar: AppBar(
        title: const Text(
            "My Goals",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black12,
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Create_Goal()),
          );
        },
        child: const Icon(Icons.add),

      ),

      body: ListView(
        children: [
          StreamBuilder<List<Goal>>(
              stream: DatabaseService().readGoals(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final goalList = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: goalList!
                        .map((goal) => GoalCard(goal: goal))
                        .toList(),
                  );
                } else {
                  return Text("Data Not found");
                }
              }),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}



class GoalCard extends StatelessWidget {

  final Goal goal;

  GoalCard({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      color: Colors.grey[200],
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
          padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Text(
              goal.name!,
              style: const TextStyle(fontSize: 20.0),
            ),

            Text(
              goal.date.toString().split(" ")[0],
              style: const TextStyle(fontSize: 20.0),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/editGoal',
                          arguments: {'goalObject': goal});
                    },
                    child: const Text("Edit")),

                // Delete Button
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            iconPadding: EdgeInsets.fromLTRB(250, 0, 0, 0),
                            icon: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            title: Text('Delete Goal ?'),
                            content: Text(
                              'This will permanently delete the Goal',
                              style: TextStyle(color: Colors.red[700]),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  DatabaseService().deleteGoal(goal.name!);
                                  Navigator.pop(context);
                                },
                                child: Text('Detele'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Delete")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

