import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/addProgram.dart';
import 'package:zenfit/UI/exercise.dart';

import 'package:zenfit/main.dart';


class SpecificWorkoutLog extends StatefulWidget {

  final String workouttime;
  final String workoutName;
  const SpecificWorkoutLog({Key? key, required this.workouttime, required this.workoutName});

  @override
  State<SpecificWorkoutLog> createState() => SpecificWorkoutLogState();
}

class SpecificWorkoutLogState extends State<SpecificWorkoutLog> {

  final _formKey = GlobalKey<FormState>();
  late String workout;



  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text(widget.workoutName, style: const TextStyle(color: Colors.white),),
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back),color: Colors.white),

        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("traininglog").doc(DatabaseService.user.uid).collection("workout").doc(widget.workouttime).collection("exercise").snapshots(),
            builder: (context,exerciseshot){
              if(exerciseshot.hasData){

                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: exerciseshot.data!.docs.length,
                      itemBuilder: (context,indexofexercise){
                        return Card(
                          color: Colors.blueGrey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                child: Row(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(exerciseshot.data!.docs[indexofexercise]['name'],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                    ),
                                    const Expanded(child: SizedBox()),

                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Card(
                                  color: Colors.black,
                                  child: StreamBuilder(
                                      stream: FirebaseFirestore.instance.collection('traininglog').doc(DatabaseService.user.uid).collection('workout').doc(widget.workouttime).collection('exercise').doc("${exerciseshot.data!.docs[indexofexercise]['time']}").collection("set").snapshots(),
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

                                                return Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Expanded(child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text("set ${index+1}",style: const TextStyle(color: Colors.white),),
                                                        )),
                                                        Expanded(child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text("${snapshot.data!.docs[index]['weight']}",style: TextStyle(color: Colors.white),),
                                                        )),
                                                        const Expanded(child: Padding(
                                                          padding: EdgeInsets.all(8.0),
                                                          child: Text("kg",style: TextStyle(color: Colors.white),),
                                                        )),
                                                        Expanded(child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text("${snapshot.data!.docs[index]['reps']}",style: TextStyle(color: Colors.white),),
                                                        )),
                                                        const Expanded(child: Padding(
                                                          padding: EdgeInsets.all(8.0),
                                                          child: Text("reps",style: TextStyle(color: Colors.white),),
                                                        )),
                                                      ],
                                                    )
                                                  ],
                                                );
                                              }
                                          );
                                        }
                                        else{
                                          return const Text("No Data has been found");
                                        }
                                      }
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                );
              }
              else if (exerciseshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              }
              else{
                return const LinearProgressIndicator();
                //return const Text("no exercise has been enlisted",style: TextStyle(color: Colors.white),);
              }
            }
        ),
      ),
    );
  }
}