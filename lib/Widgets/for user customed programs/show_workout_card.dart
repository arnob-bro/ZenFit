import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/Widgets/for%20user%20customed%20programs/show_workout_exercise_list.dart';

class ShowWorkoutCard extends StatefulWidget {
  final String programName;
  final int week;
  const ShowWorkoutCard({super.key, required this.programName, required this.week});

  @override
  State<ShowWorkoutCard> createState() => _ShowWorkoutCardState();
}

class _ShowWorkoutCardState extends State<ShowWorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('programs/mine/userIDs/${DatabaseService.user.uid}/program/${widget.programName}/weeks/${widget.week}/workout/').snapshots(),
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
                              child: ShowWorkoutExercises(workoutNo: snapshot.data!.docs[index]['no'], week: widget.week, programName: widget.programName,),
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
