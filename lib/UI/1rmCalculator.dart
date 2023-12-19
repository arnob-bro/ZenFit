import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';

class RM_Calculator extends StatefulWidget {
  const RM_Calculator({super.key});

  @override
  State<RM_Calculator> createState() => _RM_CalculatorState();
}

class _RM_CalculatorState extends State<RM_Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff37393D),
      appBar: AppBar(
        title: Text(
            "1RM Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black12,

      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Estimated 1RM',
                  style: TextStyle(
                    fontSize: 22.0,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),
            Card(
              color: Colors.white10,
              child: ListTile(


              ),
            ),
            Card(
              color: Colors.white10,
              child:Container(
                height: 100,
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Weight(kg)',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only( left: 10,right: 10),
                              child: Container(
                                height: 50,
                                width: 170,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),


                                    ),
                                  ),
                                ),

                              )
                          ),

                        ],
                      ),

                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Reps',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only( left: 10,right: 10),
                              child: Container(
                                height: 50,
                                width: 170,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),

                                    ),
                                  ),
                                ),

                              )
                          ),

                        ],

                      ),

                    ),


                  ],
                ),

              ) ,
            ),
            Card(
              color: Colors.white10,
              child: ListTile(
                title: Center(child: Text("Calculate")),
                onTap: () {


                },
              ),
            ),


          ],
        ),
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


            }, icon: const Icon(Icons.add_circle_outlined)),
            IconButton(onPressed:(){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TrainingProgram()),
              );

            }, icon: const Icon(Icons.note_alt)),
            IconButton(onPressed:(){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            }, icon: const Icon(Icons.settings)),

          ],
        ),
      ),
    );
  }
}
