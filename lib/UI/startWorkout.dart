import 'package:flutter/material.dart';
import 'package:zenfit/UI/exercise.dart';


class startWorkout extends StatefulWidget {
  const startWorkout({Key? key});

  @override
  State<startWorkout> createState() => startWorkoutState();
}

class startWorkoutState extends State<startWorkout> {
  void navigateToexercise() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Exercise()),
    );
  }

  Widget _card1() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Card(
          color: Colors.white30,
          elevation: 10,
          child: InkWell(
            onTap: () {
              navigateToexercise(); // Call the method to navigate to SecondPage
            },
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.white54),
                  SizedBox(width: 10),
                  Text('Exercise', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold, color: Colors.white54,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _card2() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Card(
          color: Colors.white30,
          elevation: 10,
          child: InkWell(
            onTap: () {
              //navigateToSecondPage(); // Call the method to navigate to SecondPage
            },
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.white54),
                  SizedBox(width: 10),
                  Text('Special Set',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white54,),
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
      backgroundColor: const Color(0xff37393D),
      appBar: AppBar(
        title: const Text('Star a new workout'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _card1(),
          const SizedBox(width: 8,),
          _card2(),
        ],
      ),
    );
  }
}