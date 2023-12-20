import 'package:flutter/material.dart';
import 'package:zenfit/UI/createGoal.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';

class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  int? selectedAbs;
  int? selectedBack;
  int? selectedBiceps;
  int? selectedChest;
  int? selectedForearms;
  int? selectedGlutes;
  int? selectedHamstrings;
  int? selectedLowerLegs;
  int? selectedQuads;
  int? selectedShoulders;
  int? selectedTriceps;
  int? selectedCardio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff37393D),
      appBar: AppBar(
        title: const Text(
          "Exercise",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black12,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          ),

        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Card(
              color: Colors.white10,
              child: SizedBox(
                //height: 550,
                child: Expanded(
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Abs'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ], onChanged: (int? newAbs) {
                          setState(() {
                            selectedAbs = newAbs;
                          });
                        },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Back'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ],  onChanged: (int? newBack) {
                          setState(() {
                            selectedBack = newBack;
                          });
                        },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Biceps'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ],  onChanged: (int? newBiceps) {
                          setState(() {
                            selectedBiceps = newBiceps;
                          });
                        },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Chest'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ],  onChanged: (int? newChest) {
                          setState(() {
                            selectedChest = newChest;
                          });
                        },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Forearms'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ], onChanged: (int? newForearms) {
                          setState(() {
                            selectedForearms = newForearms;
                          });
                        },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Glutes'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ],  onChanged: (int? newGlutes) {
                          setState(() {
                            selectedGlutes = newGlutes;
                          });
                        },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Hamstrings'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ],  onChanged: (int? newHamstrings) {
                          setState(() {
                            selectedHamstrings = newHamstrings;
                          });
                        },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Lower legs'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ],  onChanged: (int? newLowerLegs) {
                          setState(() {
                            selectedLowerLegs = newLowerLegs;
                          });
                        },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Quads'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ], onChanged: (int? newQuads) {
                          setState(() {
                            selectedQuads = newQuads;
                          });
                        },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Shoulders'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ],  onChanged: (int? newShoulders) {
                          setState(() {
                            selectedShoulders = newShoulders;
                          });
                        },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Triceps'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ],  onChanged: (int? newTriceps) {
                          setState(() {
                            selectedTriceps = newTriceps;
                          });
                        },
                        ),
                      ),

                    ],
                  )),
                ),
              ) ,
            ),
            Card(
              color: Colors.white10,
              child: SizedBox(
                //height: 70,
                child: Expanded(
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: Text('Cardio'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('3'),
                            )
                          ],  onChanged: (int? newCardio) {
                          setState(() {
                            selectedCardio = newCardio;
                          });
                        },
                        ),
                      )
                    ],
                  )),
                ),
              ) ,
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
