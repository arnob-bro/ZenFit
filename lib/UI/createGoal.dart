import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';

import '../Service/Database.dart';

class Create_Goal extends StatefulWidget {
  const Create_Goal({super.key});

  @override
  State<Create_Goal> createState() => _Create_GoalState();
}

class _Create_GoalState extends State<Create_Goal> {

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
  }

  void createGoalToDatabase() async {
    await DatabaseService().createGoal(
      date: DateTime.now(),
      name: nameController.text,
      description: descriptionController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Goal Creation successfull")));
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff37393D),
      appBar: AppBar(
        title: const Text(
            "Create Goal",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black12,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white54),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: descriptionController,
              style: const TextStyle(color: Colors.white54),
              cursorColor: Colors.white,
              maxLines: 10,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.white54),

              ),
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        createGoalToDatabase();

      },child: const Icon(Icons.save,),),
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
