import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/Widgets/for%20user%20customed%20programs/show_workout_card.dart';

class Show_User_Program extends StatefulWidget {
  final String programName;
  const Show_User_Program({super.key, required this.programName});

  @override
  State<Show_User_Program> createState() => _Show_User_ProgramState();
}

class _Show_User_ProgramState extends State<Show_User_Program> {
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

      body: Column(
        children: [
          Card(
            color: Colors.redAccent,
            child: ListTile(
                title: const Center(child: Text(
                  'Start following program',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                ),
                onTap: ()async{
                    await FirebaseFirestore.instance.collection("followedprograms")
                        .doc(DatabaseService.user.uid)
                        .collection('mine')
                        .doc(widget.programName)
                        .set({"program": widget.programName, "week": 1, "workout": 1});
                    Navigator.pop(context);
                }
            ),
          ),

          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('programs')
                  .doc('mine')
                  .collection("userIDs")
                  .doc(DatabaseService.user.uid)
                  .collection('program')
                  .doc(widget.programName)
                  .collection('weeks')
                  .snapshots(),
              builder: (context,weekshot){
                if(weekshot.connectionState == ConnectionState.waiting)
                {
                  return const Center(child: LinearProgressIndicator(),);
                }
                else if(weekshot.hasData){
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: weekshot.data!.docs.length,
                        itemBuilder: (context,index){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 50, left: 10,bottom:5),
                                  child: Text(
                                    'Week: ${index+1}',
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  )
                              ),

                              SingleChildScrollView(
                                child: ShowWorkoutCard(
                                  programName: widget.programName,
                                  week: weekshot.data!.docs[index]['time'],
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
