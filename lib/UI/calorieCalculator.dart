import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';

class Calorie_Calculator extends StatefulWidget {
  const Calorie_Calculator({super.key});

  @override
  State<Calorie_Calculator> createState() => _Calorie_CalculatorState();
}

class _Calorie_CalculatorState extends State<Calorie_Calculator> {
  int? selectedValue;
  int? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff37393D),
      appBar: AppBar(
        title: const Text(
            "Calorie Calculator",
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
                  'Estimated daily requirement',
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
                height: 290,
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
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Height(cm)',
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
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Training days/week',

                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only( left: 10,right: 10),
                              child: DropdownButton(
                                hint: Text('Choose'),
                                value: selectedValue,
                                items: [
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text('Little/None'),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text('1-3'),
                                  ),
                                  DropdownMenuItem(
                                    value: 3,
                                    child: Text('4-5'),
                                  ),
                                  DropdownMenuItem(
                                    value: 4,
                                    child: Text('6-7'),
                                  ),
                                  DropdownMenuItem(
                                    value: 5,
                                    child: Text('2 times/day'),
                                  )
                                ], onChanged: (int? newValue) {
                                  setState(() {
                                    selectedValue = newValue;
                                  });
                              },

                              ),

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
                              'Age(Year)',
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
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only( left: 10,right: 10),
                              child: DropdownButton(
                                hint: Text('Choose'),
                                value: selectedGender,

                                items: [
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text('Man'),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text('Woman'),
                                  ),

                                ], onChanged: (int? newGender) {
                                  setState(() {
                                    selectedGender = newGender;

                                  });
                              },

                              ),
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
