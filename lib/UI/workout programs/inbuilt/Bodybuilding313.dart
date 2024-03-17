import 'package:flutter/material.dart';
import 'package:zenfit/UI/workout%20programs/inbuilt/ArnoldsBasicMassRoutine.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/graphs/graph.dart';
import 'package:zenfit/UI/workout%20programs/trainingProgram.dart';
import 'package:zenfit/UI/startWorkout.dart';

class BodyBuilding313 extends StatefulWidget {
  const BodyBuilding313({super.key});

  @override
  State<BodyBuilding313> createState() => _BodyBuilding313State();
}

class _BodyBuilding313State extends State<BodyBuilding313> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff37393D),
      appBar: AppBar(
        title: const Text(
          "Bodybuilding 313",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back),color: Colors.white),
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
                'Chest & Back-Week 1,Workout 1',
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
                                  '28 reps in 4 sets',
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
                                  'Standing Cable\nChest Fly',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'T-Bar Row',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Incline Dumbbell\nPress',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  '30 reps in 4 sets',
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
                                  'Cable Close Grip\nSeated Row',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                'Legs,Calves & Abs-Week 1,Workout 2',
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
                                  'Squat',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '28 reps in 4 sets',
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
                                  'Leg Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  '60 reps in 6 sets',
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
                                  'Front Squat',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '32 reps in 4 sets',
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
                                  'Seated Leg Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 6 sets',
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
                                  '4 sets',
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
                'Shoulders,Biceps &Triceps-Week 1,Workout 3',
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
                                  'Overhead Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '23 reps in 3 sets',
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
                                  'Cable Lateral Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Dumbbell Preacher\nCurl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Barbell Standing\nTriceps Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Dumbbell lateral\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Barbell Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '28 reps in 4 sets',
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
                                  '28 reps in 4 sets',
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
                'Back & Chest-Week 1,Workout 4',
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
                                  'Lat Pulldown',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 5 sets',
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
                                  'Dumbbell Chest Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '28 reps in 4 sets',
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
                                  'Dumbbell Chest Fly',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Back Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '24 reps in 2 sets',
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
                                  'One-Handed Lat\nPulldown',
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
                                  'Incline Bench Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Dumbbell Shrug',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '20 reps in 2 sets',
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
                'Legs,Calves & Abs- Week 1,Workout 5',
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
                                  'Leg Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Barbell Lunge',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'seated Calf Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '72 reps in 6 sets',
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
                                  'Leg Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  '38 reps in 5 sets',
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
                                  '60 reps in 4 sets',
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
                'Shoulders,Biceps & Triceps-Week 1,Workout 6',
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
                                  'Dumbbell lateral\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Reverse Dumbbell\nFlyes',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Concentration Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Overhead Cable Triceps Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Dumbbell Front\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  '40 reps in 4 sets',
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
                                  'Tricep Pushdown\nWith Bar',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
              padding: EdgeInsets.only(top: 50, left: 10,bottom:5),
              child: Text(
                'Week 2',
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
                'Chest & Back-Week 2,Workout 1',
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
                                  '36 reps in 5 sets',
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
                                  'Standing Cable\nChest Fly',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'T-Bar Row',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Incline Dumbbell\nPress',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  '38 reps in 5 sets',
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
                                  'Cable Close Grip\nSeated Row',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                'Legs,Calves & Abs-Week 2,Workout 2',
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
                                  'Squat',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '36 reps in 5 sets',
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
                                  'Leg Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  '72 reps in 6 sets',
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
                                  'Front Squat',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '32 reps in 4 sets',
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
                                  'Seated Leg Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 6 sets',
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
                                  '4 sets',
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
                'Shoulders,Biceps & Triceps-Week 2,Workout 3',
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
                                  'Overhead Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '31 reps in 4 sets',
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
                                  'Cable Lateral Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Dumbbell Preacher\nCurl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Barbell Standing\nTriceps Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Dumbbell lateral\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Barbell Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '28 reps in 4 sets',
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
                                  '28 reps in 4 sets',
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
                'Back & Chest-Week2,Workout 4',
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
                                  'Lat Pulldown',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 5 sets',
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
                                  'Dumbbell Chest\nPress',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '38 reps in 5 sets',
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
                                  'Dumbbell Chest Fly',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Back Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '24 reps in 2 sets',
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
                                  'One-Handed Lat\nPulldown',
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
                                  'Incline Bench Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Dumbbell Shrug',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '20 reps in 2 sets',
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
                'Legs,Calves & Abs-Week2,workout 5',
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
                                  'Leg Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Barbell Lunge',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text('48  reps in 4 sets',
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
                                  'Seated Calf Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '72 reps in 6 sets',
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
                                  'Leg Press',
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
                                  '38 reps in 5 sets',
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
                                  '60 reps in 4 sets',
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
                'Shoulders,Biceps & Triceps-Week 2,Workout 6',
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
                                  'Dumbbell Latteral\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Reverse Dumbbell\nFlyes',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Concentration Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Overhead Cable\nTriceps extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Dumbbell Front\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  '50 reps in 5 sets',
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
                                  'Tricep Pushdown\nWith Bar',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
              padding: EdgeInsets.only(top: 50, left: 10,bottom:5),
              child: Text(
                'Week 3',
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
                'Chest & Back-Week 3,Workout 1',
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
                                  '36 reps in 5 sets',
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
                                  'Standing Cable\nChest Fly',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'T-Bar Row',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
                                  'Incline Dumbbell\nPress',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
                                  '38 reps in 5 sets',
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
                                  'Cable Close Grip\nSeated Row',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                'Legs,Calves & Abs-Week3,Workout 2',
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
                                  'Squat',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '36 reps in 5 sets',
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
                                  'Leg Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  '60 reps in 6 sets',
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
                                  'Front Squat',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 5 sets',
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
                                  'Seated Leg Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 6 sets',
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
                                  '4 sets',
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
                'Shoulders,Biceps & Triceps-Week 3,Workout 3',
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
                                  'Overhead Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '31 reps in 4 sets',
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
                                  'Cable Lateral Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Dumbbell Preacher\nCurl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  'Barbell Standing\nTriceps Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 4 sets',
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
                                  '50 reps in 5 sets',
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
                                  'Barbell Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '38 reps in 5 sets',
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
                                  'Barbell Lying\nTriceps extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '38 reps in 5 sets',
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
                'Back & Chest-Week 3,Workout 4',
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
                                  'Lat Pulldown',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 6 sets',
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
                                  'Dumbbell Chest\nPress',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '38 reps in 5 sets',
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
                                  'Dumbbell Chest Fly',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Back Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '24 reps in 2 sets',
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
                                  'One-Handed Lat\nPulldown',
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
                                  'Incline Bench Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
                                  'Dumbbell Shrug',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '20 reps in 2 sets',
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
                'Legs,Calves & Abs-Week 3,Workout 5',
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
                                  'Leg Extension',
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
                                  'Barbell Lunge',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Seated Calf Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '72 reps in 6 sets',
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
                                  'Leg Press',
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
                                  '38 reps in 5 sets',
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
                                  '60 reps in 4 sets',
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
                'Shoulders,Biceps & Triceps-Week 3,Workout 6',
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
                                  'Dumbbell Lateral\nraise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '58 reps in 5 sets',
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
                                  'Reverse Dumbbell\nFlyes',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Concentration Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Overhead Cable\nTriceps Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Dumbbell Front\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  '50 reps in 5 sets',
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
                                  'Tricep Pushdown\nWith Bar',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
              padding: EdgeInsets.only(top: 50, left: 10,bottom:5),
              child: Text(
                'Week 4',
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
                'Chest & Back-Week 4,Workout 1',
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
                                  '36 reps in 5 sets',
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
                                  'Standing Cable\nChest Fly',
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
                                  'T-Bar Row',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
                                  'Incline Dumbbell\nPress',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
                                  '38 reps in 5 sets',
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
                                  'cable Close Grip\nSeated Row',
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



                ],
              ),

            ) ,
          ),






          const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Legs,Calves & Abs-Week 4,Workout 2',
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
                                  'Squat',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '36 reps in 5 sets',
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
                                  'Leg Extension',
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
                                  '60 reps in 6 sets',
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
                                  'Front Squat',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '40 reps in 5 sets',
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
                                  'Seated Leg Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '60 reps in 6 sets',
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
                                  '4 sets',
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
                'Shoulders,Biceps & Triceps-Week 4,Workout 3',
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
                                  'Overhead Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '31 reps in 4 sets',
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
                                  'Cable lateral Raise',
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
                                  'Dumbbell Preacher\nCurl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
                                  'Barbell Standing\nTriceps Extension',
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
                                  'Dumbbell Lateral\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
                                  'Barbell Curl',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '38 reps in 5 sets',
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
                                  '38 reps in 5 sets',
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
                'Back & Chest-Week 4,Workout 4',
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
                                  'Lat Pulldown',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '6 sets',
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
                                  'Dumbbell Chest\nPress',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '38 reps in 5 sets',
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
                                  'Dumbbell Chest Fly',
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
                                  'Back Extension',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '24 reps in 2 sets',
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
                                  'One-Handed Lat\nPulldown',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '72 reps in 6 sets',
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
                                  'Incline Bench Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
                                  'Dumbbell Shrug',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '20 reps in 2 sets',
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
                'Legs,Calves & Abs-Week 4,Workout 5',
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
                                  'Leg Extension',
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
                                  'Barbell Lunge',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Seated Calf Raise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '72 reps in 6 sets',
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
                                  'Leg Press',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '72 reps in 6 sets',
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
                                  '38 reps in 5 sets',
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
                                  '60 reps in 4 sets',
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
                'Shoulders,Biceps & Triceps-Week 4,Workout 6',
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
                                  'Dumbbell Lateral\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '58 reps in 5 sets',
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
                                  'Reverse Dumbbell\nFlyes',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  'Concentration Curl',
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
                                  'Overhead Cable\nTriceps Extension',
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
                                  'Dumbbell Front\nRaise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '48 reps in 4 sets',
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
                                  '50 reps in 5 sets',
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
                                  'Tricep Pushdown\nWith Bar',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                                Text(
                                  '50 reps in 5 sets',
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
