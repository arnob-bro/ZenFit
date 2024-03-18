import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/exercise.dart';
import 'package:zenfit/main.dart';




class startWorkout_fromprogram extends StatefulWidget {
  final CollectionReference logCollection ;
  final String programName;
  final String category;
  final QuerySnapshot WeekQuery;
  final QuerySnapshot workoutQuery;
  final String workoutName;
  final String workoutTime;
  const startWorkout_fromprogram({super.key, required this.logCollection, required this.workoutName, required this.workoutTime, required this.WeekQuery, required this.programName, required this.category, required this.workoutQuery,});

  @override
  State<startWorkout_fromprogram> createState() => startWorkout_fromprogramState();
}

class startWorkout_fromprogramState extends State<startWorkout_fromprogram> {




  @override
  Widget build(BuildContext context) {


    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black12,
            title: Text("    ${widget.workoutName}", style: const TextStyle(color: Colors.white)),

            actions: [
              IconButton(
                  onPressed: () async{
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    int weeksize = widget.WeekQuery.docs.length;
                    int workoutsize = widget.workoutQuery.docs.length;
                    if(widget.category == 'mine'){
                      await FirebaseFirestore.instance.collection("followedprograms").doc(DatabaseService.me.id).collection("mine").doc(widget.programName).get().then(
                            (DocumentSnapshot doc) async {
                          final data = doc.data() as Map<String, dynamic>;
                          int week= data['week'];
                          int workout = data['workout'];
                          if((workout+1 <=workoutsize) && (week <= weeksize) )
                            {
                              await FirebaseFirestore.instance.collection("followedprograms").doc(DatabaseService.me.id).collection("mine").doc(widget.programName).set({"week":week, "workout": workout+1,"program": widget.programName});
                            }
                          else if((workout+1 >workoutsize) && (week+1 <= weeksize))
                            {
                              await FirebaseFirestore.instance.collection("followedprograms").doc(DatabaseService.me.id).collection("mine").doc(widget.programName).set({"week": week+1, "workout": 1,"program": widget.programName});
                            }
                          else if((workout+1 >workoutsize) && (week+1 > weeksize)){
                            await FirebaseFirestore.instance.collection("followedprograms").doc(DatabaseService.me.id).collection("mine").doc(widget.programName).set({"week": 1, "workout": 1,"program": widget.programName});
                          }
                        },
                        onError: (e) => print("Error getting document: $e"),
                      );
                    }

                    Navigator.pop(context);
                    Navigator.pop(context);

                  },
                  icon: Icon(Icons.save,color: Colors.grey,)
              )
            ],
          ),
          body: Column(
            children: [
              StreamBuilder(
                  stream: widget.logCollection.snapshots(),
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

                                          IconButton(
                                              onPressed: ()async{
                                                await FirebaseFirestore.instance.collection('traininglog').doc(DatabaseService.user.uid).collection("workout").doc(widget.workoutTime).collection("exercise").doc(exerciseshot.data!.docs[indexofexercise]['time']).delete();
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
                                            /*stream: FirebaseFirestore.instance
                                                .collection('traininglog')
                                                .doc(DatabaseService.user.uid)
                                                .collection('workout')
                                                .doc(widget.workoutTime)
                                                .collection('exercise')
                                                .doc("${exerciseshot.data!.docs[indexofexercise]['time']}")
                                                .collection("set")
                                                .snapshots(),*/
                                            stream: exerciseshot.data!.docs[indexofexercise].reference.collection('set').snapshots(),
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

                                                                      await snapshot.data!
                                                                          .docs[index].reference
                                                                          .update({'weight' : int.parse(value)});

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

                                                                      await snapshot.data!
                                                                          .docs[index].reference
                                                                          .update({'reps' : int.parse(value)});

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
                                                                    await snapshot.data!
                                                                        .docs[index].reference
                                                                        .delete();
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
                                          await exerciseshot.data!
                                              .docs[indexofexercise].reference
                                              .collection('set')
                                              .add({"time": time,"reps": 0,"weight": 0});
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

            ],
          ),
        ),
      ),
    );
  }
}