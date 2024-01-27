import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class WorkoutDayExercises extends StatefulWidget {
  final int workoutNo;
  final String programTitle;
  final String programName;
  final int week;
  const WorkoutDayExercises( {super.key, required this.workoutNo, required this.programTitle, required this.programName, required this.week});

  @override
  State<WorkoutDayExercises> createState() => _WorkoutDayExercisesState();
}

class _WorkoutDayExercisesState extends State<WorkoutDayExercises> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('programs').doc('other').collection(widget.programTitle).doc(widget.programName).collection('weeks').doc('${widget.week}').collection('workout').doc('${widget.workoutNo}').collection('exercise').snapshots(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(child: LinearProgressIndicator(),);
          }
          else if(snapshot.hasData){
            return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                        snapshot.data!.docs[index]['name'],
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${snapshot.data!.docs[index]['reps']} reps in ${snapshot.data!.docs[index]['sets']} sets',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                    ],
                  )
                                    );
                }

            );
          }
          else{
            return const Text("No Data has been found");
          }
        }
    );
  }
}
