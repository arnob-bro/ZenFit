import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Widgets/for%20inbuilt%20programs/workout_day_card.dart';

import '../../../main.dart';

class ABMR6DP1W extends StatefulWidget {
  const ABMR6DP1W({super.key});

  @override
  State<ABMR6DP1W> createState() => _ABMR6DP1WState();
}

class _ABMR6DP1WState extends State<ABMR6DP1W> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "6 days per week",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back),color: Colors.white),
        backgroundColor: Colors.black12,

      ),

      body: Column(
        children: [
          Card(
            color: Colors.white10,
            child: ListTile(
                title: const Center(child: Text(
                  'Start following program',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white54,
                  ),
                ),
                ),
                onTap: (){

                }
            ),
          ),

          StreamBuilder(
              stream: FirebaseFirestore.instance.collection('programs').doc('other').collection("Arnold's Basic Mass Routine").doc('6 days per week').collection('weeks').snapshots(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting)
                {
                  return const Center(child: LinearProgressIndicator(),);
                }
                else if(snapshot.hasData){
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 50, left: 10,bottom:5),
                                  child: Text(
                                    'Week: ${snapshot.data!.docs[index]['week']}',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  )
                              ),

                              SingleChildScrollView(
                                child: WorkoutDayCard(
                                  programTitle: "Arnold's Basic Mass Routine",
                                  programName: '6 days per week',
                                  week: snapshot.data!.docs[index]['week'],
                                ),
                              )
                            ],
                          );
                        }
                    ),
                  );
                }
                else{
                  return const Text("No Data has been found");
                }
              }
          )
        ],
      ),
    );
  }
}
