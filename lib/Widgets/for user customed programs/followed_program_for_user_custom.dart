import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                          subtitle: Text("week ${snapshot.data!.docs[index]['week']}, workout ${snapshot.data!.docs[index]['workout']}"),
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
                                            await FirebaseFirestore.instance.collection('followedprograms').doc(DatabaseService.me.id).collection('mine').doc("${snapshot.data!.docs[index]['program']}").delete();
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
    );
  }
}
