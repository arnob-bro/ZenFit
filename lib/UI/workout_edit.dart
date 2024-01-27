import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/exercise.dart';

import '../main.dart';


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
      MaterialPageRoute(builder: (context) => Exercise(category: 'mine', programName: widget.programName, weektime: widget.weektime, workouttime: widget.workouttime, workoutName: widget.workoutName,)),
    );
  }

  Widget _card1() {
    return Card(
      color: Colors.redAccent,
      //elevation: 10,
      child: InkWell(
        onTap: () {
          navigateToexercise(); // Call the method to navigate to SecondPage
        },
        child: const Padding(
          padding: EdgeInsets.all(10.0),
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
        actions: [
          IconButton(
              onPressed: null,
              icon: const Icon(Icons.menu_sharp,color: Colors.grey,)
          )
        ],
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance.collection('programs').doc('mine').collection('userIDs').doc(DatabaseService.user.uid).collection("program").doc(widget.programName).collection("weeks").doc(widget.weektime).collection("workout").doc(widget.workouttime).collection("exercise").snapshots(),
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
                                      Text(exerciseshot.data!.docs[indexofexercise]['name'],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                      Expanded(child: SizedBox()),
                                      IconButton(
                                          onPressed: ()async{
                                            await FirebaseFirestore.instance.collection('programs').doc('mine').collection('userIDs').doc(DatabaseService.user.uid).collection("program").doc(widget.programName).collection("weeks").doc(widget.weektime).collection("workout").doc(widget.workouttime).collection("exercise").doc(exerciseshot.data!.docs[indexofexercise]['time']).delete();
                                          },
                                          icon: Icon(Icons.delete,color: Colors.redAccent,)
                                      )
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Card(
                                    color: Colors.black,
                                    child: StreamBuilder(
                                        stream: FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(widget.programName).collection('weeks').doc(widget.weektime).collection('workout').doc(widget.workouttime).collection('exercise').doc("${exerciseshot.data!.docs[indexofexercise]['time']}").collection("set").snapshots(),
                                        builder: (context,snapshot){
                                          if(snapshot.connectionState == ConnectionState.waiting)
                                          {
                                            return const Center(child: LinearProgressIndicator(),);
                                          }
                                          else if(snapshot.hasData){
                                            print("in it");
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
                                                          Text("set ${index+1}",style: const TextStyle(color: Colors.white),),
                                                          SizedBox(
                                                            width: mq.width * 0.2,
                                                            child: TextFormField(
                                                              initialValue: "${snapshot.data!.docs[index]['weight']}",
                                                              keyboardType: TextInputType.number,
                                                              //maxLength: 4,
                                                              maxLines: 1,
                                                              style: const TextStyle(color: Colors.white),
                                                              textAlign: TextAlign.center,
                                                              onChanged: (value) async{
                                  
                                                                  await FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(widget.programName).collection('weeks').doc(widget.weektime).collection('workout').doc(widget.workouttime).collection('exercise').doc("${exerciseshot.data!.docs[indexofexercise]['time']}").collection("set").doc("${snapshot.data!.docs[index]['time']}").update({'weight' : int.parse(value)});
                                  
                                                              },
                                  
                                                              decoration: const InputDecoration(
                                                                filled: true,
                                                                fillColor: Colors.white10,
                                                              ),
                                                            )
                                                          ),
                                                          const Text("kg",style: TextStyle(color: Colors.white),),
                                                          SizedBox(
                                                              width: mq.width * 0.2,
                                                              child: TextFormField(
                                                                initialValue: "${snapshot.data!.docs[index]['reps']}",
                                                                keyboardType: TextInputType.number,
                                                                //maxLength: 4,
                                                                maxLines: 1,
                                                                style: const TextStyle(color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                                onChanged: (value) async{
                                  
                                                                    await FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(widget.programName).collection('weeks').doc(widget.weektime).collection('workout').doc(widget.workouttime).collection('exercise').doc("${exerciseshot.data!.docs[indexofexercise]['time']}").collection("set").doc("${snapshot.data!.docs[index]['time']}").update({'reps' : int.parse(value)});
                                  
                                                                },
                                  
                                                                decoration: const InputDecoration(
                                                                  filled: true,
                                                                  fillColor: Colors.white10,
                                                                ),
                                                              )
                                                          ),
                                                          const Text("reps",style: TextStyle(color: Colors.white),),
                                                          IconButton(
                                                              onPressed: ()async{
                                                                await FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(widget.programName).collection('weeks').doc(widget.weektime).collection('workout').doc(widget.workouttime).collection('exercise').doc("${exerciseshot.data!.docs[indexofexercise]['time']}").collection("set").doc("${snapshot.data!.docs[index]['time']}").delete();
                                                              },
                                                              icon: const Icon(Icons.delete,color: Colors.grey,)
                                                          ),
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
                                Align(alignment:Alignment.bottomRight ,child: IconButton(
                                    onPressed: ()async{
                                      String time = DateTime.now().millisecondsSinceEpoch.toString();
                                      await FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(widget.programName).collection('weeks').doc(widget.weektime).collection('workout').doc(widget.workouttime).collection('exercise').doc("${exerciseshot.data!.docs[indexofexercise]['time']}").collection("set").doc(time).set({"time": time,"reps": 0,"weight": 0});
                                    },
                                    icon: const Icon(Icons.add,color: Colors.redAccent,)),
                                )
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
          _card1(),
        ],
      ),
    );
  }
}