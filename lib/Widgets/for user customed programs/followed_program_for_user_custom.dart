import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/UI/followedprograms/startworkout_fromprogram.dart';
import 'package:zenfit/Widgets/for%20user%20customed%20programs/show_user_customed_programs.dart';

import '../../UI/workout programs/custom/addProgram.dart';
import '../../UI/graphs/graph.dart';
import '../../UI/homepage.dart';
import '../../UI/settings.dart';
import '../../UI/workout programs/trainingProgram.dart';
import 'package:zenfit/Service/Database.dart';
import '../../main.dart';

class FollowedUserPrograms extends StatefulWidget {

  const FollowedUserPrograms({super.key});

  @override
  State<FollowedUserPrograms> createState() => _FollowedUserProgramsState();
}

class _FollowedUserProgramsState extends State<FollowedUserPrograms> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Followed Custom Programs",
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
          stream: FirebaseFirestore.instance.collection('followedprograms').doc(DatabaseService.me.id).collection('mine').snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    return Card(
                      color: Colors.blueGrey,
                      child: ListTile(
                          textColor: Colors.white,
                          title: Text("${snapshot.data!.docs[index]['program']}"),
                          subtitle: Text("week ${snapshot.data!.docs[index]['week'].toString()}, workout ${snapshot.data!.docs[index]['workout'].toString()}"),
                          trailing: IconButton(
                              onPressed: (){
                                showModalBottomSheet(
                                  backgroundColor: Colors.grey,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)
                                      )
                                  ),
                                  builder: (context){
                                    return ListView(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.only(top: 10,bottom: 15),
                                      children: [
                                        Container(
                                          height: 4,
                                          margin: EdgeInsets.symmetric(horizontal: mq.width * .4),
                                          decoration: BoxDecoration(
                                            color: Colors.grey, borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),


                                        InkWell(
                                          onTap: ()async{
                                            await FirebaseFirestore.instance
                                                .collection('followedprograms')
                                                .doc(DatabaseService.me.id.toString())
                                                .collection('mine')
                                                .doc(snapshot.data!.docs[index]['program'].toString())
                                                .delete();

                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: mq.width * .05,
                                                top: mq.height * .02,
                                                bottom: mq.height * .02
                                            ),
                                            child: const Row(children: [ Icon(Icons.delete_forever,color: Colors.red,size: 26,),Flexible(child: Text('    Unfollow Program',style: TextStyle(fontSize: 15,color: Colors.red,letterSpacing: 0.5),))],),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.menu_sharp)
                          ),
                          onTap: ()async{
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                            int time = DateTime.now().millisecondsSinceEpoch;

                            QuerySnapshot<Map<String, dynamic>> weekquery = await FirebaseFirestore.instance
                                .collection("programs")
                                .doc("mine")
                                .collection("userIDs")
                                .doc(DatabaseService.me.id)
                                .collection("program")
                                .doc("${snapshot.data!.docs[index]['program']}")
                                .collection("weeks")
                                .get();

                            // Get the nth document
                            DocumentSnapshot<Map<String, dynamic>> weekthDocument = weekquery.docs[snapshot.data!.docs[index]["week"]-1];
                            //print(weekthDocument);
                            
                            QuerySnapshot<Map<String,dynamic>>  workoutquery = await weekthDocument.reference.collection("workout").get();

                            DocumentSnapshot<Map<String,dynamic>> workoutthDocument = workoutquery.docs[snapshot.data!.docs[index]["workout"]-1];
                            //print(workoutthDocument.data());
                            CollectionReference sourceCollection = workoutthDocument.reference.collection("exercise");
                            //print(sourceCollection.toString());

                           await  FirebaseFirestore.instance
                                .collection('traininglog')
                                .doc(DatabaseService.me.id)
                                .collection('workout')
                                .doc(time.toString())
                                .set({"name": workoutthDocument["name"],"time":time.toString()});


                            CollectionReference targetCollection = FirebaseFirestore.instance
                                .collection('traininglog')
                                .doc(DatabaseService.me.id)
                                .collection('workout')
                                .doc(time.toString())
                                .collection('exercise');

                            // Replace 'sourceCollection' and 'targetCollection' with your collection paths
                            await FirestoreCopy().copyCollection(sourceCollection, targetCollection).then((_) {
                              print('Collection copied successfully');
                            }).catchError((error) {
                              print('Error copying collection: $error');
                            });
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => startWorkout_fromprogram(
                                        logCollection: targetCollection,
                                        workoutName: workoutthDocument["name"],
                                        workoutTime: time.toString(), 
                                      WeekQuery: weekquery, 
                                      programName: snapshot.data!.docs[index]['program'], category: 'mine', workoutQuery: workoutquery,
                                    )
                                )
                            );
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
    );
  }
}





class FirestoreCopy {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> copyCollection(CollectionReference sourceCollectionPath, CollectionReference targetCollectionPath) async {
    try {
      QuerySnapshot sourceSnapshot = await sourceCollectionPath.get();

      for (QueryDocumentSnapshot doc in sourceSnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        if (kDebugMode) {
          print(data);
        }
        DocumentReference newDocRef = await targetCollectionPath.add(data);
        if (kDebugMode) {
          print(newDocRef.toString());
        }

        // Copy subcollections recursively
        await _copySubcollections(doc.reference, newDocRef);
      }
    } catch (error) {
      print('Error copying collection: $error');
      // Handle error gracefully
    }
  }

  Future<void> _copySubcollections(DocumentReference sourceDocRef, DocumentReference targetDocRef) async {
    try {
      // Copy "exercise" subcollection
      QuerySnapshot exerciseSnapshot = await sourceDocRef.collection('set').get();

      for (QueryDocumentSnapshot exerciseDoc in exerciseSnapshot.docs) {
        Map<String, dynamic> exerciseData = exerciseDoc.data() as Map<String, dynamic>;

        DocumentReference newExerciseRef = await targetDocRef.collection('set').add(exerciseData);
        if (kDebugMode) {
          print(exerciseDoc.reference.toString());
        }
        // Copy "sets" subcollection
        //await _copySetsCollection(exerciseDoc.reference, newExerciseRef);
      }
    } catch (error) {
      print('Error copying "exercise" subcollection: $error');
      // Handle error gracefully
    }
  }

  /*Future<void> _copySetsCollection(DocumentReference sourceExerciseRef, DocumentReference targetExerciseRef) async {
    try {
      // Copy "set" subcollection
      QuerySnapshot setsSnapshot = await sourceExerciseRef.collection('set').get();

      for (QueryDocumentSnapshot setDoc in setsSnapshot.docs) {
        Map<String, dynamic> setData = setDoc.data() as Map<String, dynamic>;
        if (kDebugMode) {
          print(setData);
        }
        await targetExerciseRef.collection('set').add(setData);
      }
    } catch (error) {
      print('Error copying "sets" subcollection: $error');
      // Handle error gracefully
    }
  }*/
}

