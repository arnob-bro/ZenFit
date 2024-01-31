

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:zenfit/Widgets/for%20inbuilt%20programs/workout_day_exercise_list.dart';


class WorkoutDayCard extends StatefulWidget {
  final String programTitle;
  final String programName;
  final int week;
  const WorkoutDayCard({super.key, required this.programTitle, required this.programName, required this.week});

  @override
  State<WorkoutDayCard> createState() => _WorkoutDayCardState();
}

class _WorkoutDayCardState extends State<WorkoutDayCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('programs/other/${widget.programTitle}/${widget.programName}/weeks/${widget.week}/workout/').snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting)
            {
              return const Center(child: LinearProgressIndicator(),);
            }
            else if(snapshot.hasData){
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  primary: false,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    return Column(

                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              'Workout ${index +1} : ${snapshot.data!.docs[index]['name']}',
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            )
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Card(
                            color: Colors.blueGrey,
                            child: WorkoutDayExercises(workoutNo: snapshot.data!.docs[index]['no'], week: widget.week, programTitle: widget.programTitle, programName: widget.programName,),
                          ),
                        ),

                      ]
                    );
                  }
              );
            }
            else{
              return const Text("No Data has been found");
            }
          }
      ),
    );
  }
}