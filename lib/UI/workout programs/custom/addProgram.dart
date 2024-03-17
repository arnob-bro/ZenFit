import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/graphs/graph.dart';
import 'package:zenfit/UI/workout%20programs/trainingProgram.dart';
import 'package:zenfit/UI/workout_edit.dart';

import '../../../Service/Database.dart';
import '../../../Widgets/for user customed programs/show_workout_card.dart';
import 'mine.dart';



class AddProgram extends StatefulWidget {
  final String programName;
  const AddProgram({super.key, required this.programName});

  @override
  State<AddProgram> createState() => _AddProgramState();
}


class _AddProgramState extends State<AddProgram> {

  var weektime,workouttime;
  final _formKey = GlobalKey<FormState>();
  late String program;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.programName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back),color: Colors.white),


        backgroundColor: Colors.black12,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(widget.programName).collection('weeks').snapshots(),
          builder: (context,weekshot){
            if(weekshot.connectionState == ConnectionState.waiting)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(weekshot.hasData){

              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: weekshot.data!.docs.length,
                  itemBuilder: (context,indexofweek){
                    weektime = weekshot.data!.docs[indexofweek]['time'];
                    int workout = 1;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 50, left: 10,bottom:5),
                            child: ListTile(
                              leading: Text(
                                'Week: ${indexofweek+1}',
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),

                              trailing: IconButton(onPressed: ()async{await FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(widget.programName).collection('weeks').doc('${weekshot.data!.docs[indexofweek]['time']}').delete();}, icon: const Icon(Icons.delete,color: Colors.redAccent,))
                            )
                        ),

                        SingleChildScrollView(
                          child: Card(
                            color: Colors.black,
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance.collection('programs/mine/userIDs/${DatabaseService.user.uid}/program/${widget.programName}/weeks/${weekshot.data!.docs[indexofweek]['time']}/workout/').snapshots(),
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
                                          workouttime = snapshot.data!.docs[index]['time'];
                                          workout = snapshot.data!.docs.length+1;
                                          return Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Card(
                                                color: Colors.blueGrey,
                                                child: ListTile(
                                                    title: Text('${snapshot.data!.docs[index]['name']} ${index+1}', style: const TextStyle(fontSize: 20.0, color: Colors.white,),),
                                                    trailing: IconButton(onPressed: ()async{
                                                      await FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(widget.programName).collection('weeks').doc("${weekshot.data!.docs[indexofweek]['time']}").collection('workout').doc('${snapshot.data!.docs[index]['time']}').delete();
                                                      } , icon: Icon(Icons.delete)
                                                    ),
                                                  onTap: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> workoutEdit(programName: widget.programName, weektime: weekshot.data!.docs[indexofweek]['time'], workouttime: snapshot.data!.docs[index]['time'], workoutName: snapshot.data!.docs[index]['name'],)));
                                                  },
                                                )
                                              )
                                          );
                                        }
                                    );
                                  }
                                  else{
                                    return const Text("No Data has been found");
                                  }
                                }
                            ),
                          )
                        ),
                        Center(child: TextButton(onPressed: ()async{
                          workouttime = DateTime.now().millisecondsSinceEpoch.toString();
                          await FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(widget.programName).collection('weeks').doc("${weekshot.data!.docs[indexofweek]['time']}").collection('workout').doc('${workouttime}').set({'name': 'new workout','time': workouttime});
                        },
                            child: const Text("Add Workout",style: TextStyle(color: Colors.blueGrey),))
                        ),
                      ],
                    );
                  }
              );
            }
            else{
              return const Text("No Data has been found",style: TextStyle(color: Colors.white),);
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
            const IconButton(onPressed: null, icon: Icon(Icons.add_circle_outlined,color: Colors.grey,)),
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
        onPressed: ()async{
          weektime=DateTime.now().millisecondsSinceEpoch.toString();
          await FirebaseFirestore.instance.collection('programs').doc('mine').collection("userIDs").doc(DatabaseService.user.uid).collection('program').doc(widget.programName).collection('weeks').doc("$weektime").set({'time': weektime});
        },
        backgroundColor: Colors.blueGrey,
        shape: const CircleBorder(),
        child: const Icon(Icons.add,color: Colors.lightGreen,),),

    );
  }
}