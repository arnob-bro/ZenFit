import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/workout%20programs/custom/addProgram.dart';
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

  final _formKey = GlobalKey<FormState>();
  late String workout;
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
          actions: [
            IconButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          contentPadding: const EdgeInsets.only(left: 24,right: 24,top: 20,bottom: 10),
                          backgroundColor: Colors.blueGrey,
                          title: const Text('Change Workout Name',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.center,),
                          content: SizedBox(
                            height: 100,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Name',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        //initialValue: widget.programName,
                                        onSaved: (val)async{
                                          workout = val ?? "";
                                          await FirebaseFirestore.instance.collection('programs').doc('mine').collection('userIDs').doc(DatabaseService.user.uid).collection("program").doc(widget.programName).collection("weeks").doc(widget.weektime).collection("workout").doc(widget.workouttime).update({"name": workout});
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        validator: (val) => val != null && val.isNotEmpty ? null : "Required program name",
                                        cursorColor: Colors.white,
                                        cursorHeight: 18,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 1),
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.black,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20)
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                                ),

                                TextButton(onPressed: () async {
                                  if(_formKey.currentState!.validate()){
                                    _formKey.currentState!.save();
                                    //await FirebaseFirestore.instance.collection('programs').doc('mine').collection('userIDs').doc(DatabaseService.user.uid).collection("program").doc(widget.programName).collection("weeks").doc(widget.weektime).collection("workout").doc(widget.workouttime).update({'name': workout});
                                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => AddProgram(programName: widget.programName)));
                                  }
                                },
                                    child: const Text("Save Name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)
                                )
                              ],
                            )

                          ],
                        );
                      }
                  );
                },
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
                                                                //maxLines: 1,
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
                                                                  //maxLines: 1,
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
      ),
    );
  }
}