import 'package:flutter/material.dart';
import 'package:zenfit/UI/exercise.dart';


class workoutEdit extends StatefulWidget {
  final String programName;
  final String weektime;
  final String workouttime;
  final String workoutName;
  const workoutEdit({Key? key, required this.programName, required this.weektime, required this.workouttime, required this.workoutName});

  @override
  State<workoutEdit> createState() => workoutEditState();
}

class workoutEditState extends State<workoutEdit> {
  void navigateToexercise() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Exercise(category: 'mine',)),
    );
  }

  Widget _card1() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Card(
          color: Colors.redAccent,
          //elevation: 10,
          child: InkWell(
            onTap: () {
              navigateToexercise(); // Call the method to navigate to SecondPage
            },
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Exercise', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold, color: Colors.white,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(widget.workoutName, style: const TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back),color: Colors.white),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _card1(),
            ),
          ),

        ],
      ),
    );
  }
}