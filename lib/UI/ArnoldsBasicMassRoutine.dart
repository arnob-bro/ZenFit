import 'package:flutter/material.dart';
import 'package:zenfit/UI/ArnoldsBasicMassRoutine.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/startWorkout.dart';

class ArnoldsBasicMassRoutine extends StatefulWidget {
  const ArnoldsBasicMassRoutine({super.key});

  @override
  State<ArnoldsBasicMassRoutine> createState() => _ArnoldsBasicMassRoutineState();
}

class _ArnoldsBasicMassRoutineState extends State<ArnoldsBasicMassRoutine> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff37393D),
      appBar: AppBar(
        title: const Text(
          "Arnold's Basic Mass Routine",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black12,

      ),

      body: ListView(
        children: [

          Card(
            color: Colors.white10,
            child: ListTile(
                title: const Center(child: Text(
                  'Start following program',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white54,
                  ),
                ),
                ),
                onTap: (){

                }
            ),
          ),

          const Padding(
              padding: EdgeInsets.only(top: 50, left: 10,bottom:5),
              child: Text(
                'Week 1',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),

          const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Workout 1:Chest & Back',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white54,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),



          const Card(
            color: Colors.white10,
            child:SizedBox(
              //height: 280,
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bench Press',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white54,
                                ),
                              ),
                              Text(
                                '60 reps in 5 sets',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          )
                        ),

                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pullover',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Barbell Row',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hanging Leg Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '125 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Incline Bench Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pull-Up',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '4 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deadlift',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '20 reps in 3 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),


                      ],

                    ),
                  ),



                ],
              ),

            ) ,
          ),






          const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Workout 2:Shoulders & Arms',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white54,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),
          const Card(
            color: Colors.white10,
            child:SizedBox(
              //height: 370,
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Overhead Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),

                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Push Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dumbbell Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Barbell Lying\nTriceps Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Barbell Wrist\nExtension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dumbbell Lateral\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Burbell Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Close-Grip Bench\nPress',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Barbell Wrist Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Crunch',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '125 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),



                ],
              ),

            ) ,
          ),


          const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Workout 3:Legs & Glutes',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white54,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),



          const Card(
            color: Colors.white10,
            child:SizedBox(
              //height: 280,
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Squat',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),

                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lying Leg Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Stiff-Legged Deadlift',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '20 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hanging Leg Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '125 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Barbell Lunge',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Standing Calf Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Good Morning',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '20 reps in 3 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),


                      ],

                    ),
                  ),



                ],
              ),

            ) ,
          ),

          const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Workout 4:Chest & Back',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white54,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),



          const Card(
            color: Colors.white10,
            child:SizedBox(
              //height: 280,
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bench Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),

                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pullover',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Barbell Row',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hanging Leg Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '125 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Incline Bench Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pull-Up',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '4 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deadlift',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '20 reps in 3 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),


                      ],

                    ),
                  ),



                ],
              ),

            ) ,
          ),

          const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Workout 5:Shoulders & Arms',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white54,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),

          const Card(
            color: Colors.white10,
            child:SizedBox(
              //height: 370,
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Overhead Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),

                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Push Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dumbbell Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Barbell Lying\nTriceps Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Barbell Wrist\nExtension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dumbbell Lateral\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Burbell Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Close-Grip Bench\nPress',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Barbell Wrist Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Crunch',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '125 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),



                ],
              ),

            ) ,
          ),







          const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Workout 6:Legs & Glutes',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white54,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),





          const Card(
            color: Colors.white10,
            child:SizedBox(
              //height: 280,
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Squat',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),

                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lying Leg Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Stiff-Legged Deadlift',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '20 reps in 3 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hanging Leg Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '125 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Barbell Lunge',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Standing Calf Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 5 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Good Morning',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '20 reps in 3 sets',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            )
                        ),


                      ],

                    ),
                  ),



                ],
              ),

            ) ,
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
                MaterialPageRoute(builder: (context) => const settings()),
              );

            }, icon: const Icon(Icons.settings)),

          ],
        ),
      ),


    );
  }
}
