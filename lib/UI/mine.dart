import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/addProgram.dart';
import 'package:zenfit/UI/startWorkout.dart';

import '../Widgets/for user customed programs/show_user_customed_programs.dart';



class Mine extends StatefulWidget {
  const Mine({super.key});

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {

  final _formKey = GlobalKey<FormState>();


  void navigateTostartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const startWorkout()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
            "Mine",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back),color: Colors.white),
        backgroundColor: Colors.black12,

      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('programs').doc('mine').collection('userIDs').doc(DatabaseService.user.uid).collection('program').snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  return Card(
                    color: Colors.blueGrey,
                    child: ListTile(
                        textColor: Colors.white,
                        title: Text("${snapshot.data!.docs[index]['name']}"),
                        onTap: (){
                          Navigator.push(context,  MaterialPageRoute(builder: (context) => Show_User_Program(programName: snapshot.data!.docs[index]['name'],)));
                        }
                    ),
                  );
                }
              );
            }
            else{
              return const LinearProgressIndicator();
            }
          }
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

            }, icon: const Icon(Icons.add_circle_outlined,color: Colors.grey,)),
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
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            String programName = "";
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    contentPadding: const EdgeInsets.only(left: 24,right: 24,top: 20,bottom: 10),
                    backgroundColor: Colors.blueGrey,
                    title: const Text('Create Program',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.center,),
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
                                  initialValue: 'New Program',
                                  onSaved: (val) => programName = val ?? "",
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

                            TextButton(onPressed: ()async{
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                await FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(programName).set({'name': programName});
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddProgram(programName: programName)));
                              }
                            },
                                child: const Text("Create program",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)
                            )
                          ],
                        )

                    ],
                  );
                }
            );
          },
          backgroundColor: Colors.blueGrey,
          shape: const CircleBorder(),
          child: const Icon(Icons.add,color: Colors.lightGreen,)
      ),
    );
  }
}
