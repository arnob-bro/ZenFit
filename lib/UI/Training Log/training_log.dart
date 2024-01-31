import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/UI/Training%20Log/show_specific_workout_log.dart';
import 'package:zenfit/helper/my_date_util.dart';

import '../../Service/Database.dart';
import '../../main.dart';

class TrainingLog extends StatefulWidget {
  const TrainingLog({super.key});

  @override
  State<TrainingLog> createState() => _TrainingLogState();
}

class _TrainingLogState extends State<TrainingLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Training Log",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back),color: Colors.white),
        backgroundColor: Colors.black12,
      ),

      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("traininglog").doc(DatabaseService.user.uid).collection("workout").snapshots(),
          builder: (context,workoutshot){
            return ListView.builder(
                itemCount: workoutshot.data!.docs.length,
                itemBuilder: (context,indexofworkout){
                  return Card(
                    color: Colors.blueGrey,
                    child: ListTile(
                      title: Text(workoutshot.data!.docs[indexofworkout]["name"],style: const TextStyle(color: Colors.white),),
                      trailing: Text(MyDateUtil().getMessageTime(context: context, time: workoutshot.data!.docs[indexofworkout]["time"]),style: TextStyle(color: Colors.white54),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SpecificWorkoutLog(workouttime: workoutshot.data!.docs[indexofworkout]["time"], workoutName: workoutshot.data!.docs[indexofworkout]["name"])));
                      },
                    ),
                  );
                }
            );
          }
      )
    );
  }
}
