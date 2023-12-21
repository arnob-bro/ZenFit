import 'package:flutter/material.dart';
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
            icon: const Icon(Icons.search),
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
                child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Abs'),
                          isExpanded: true,
                          items: const [
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
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Back'),
                          isExpanded: true,
                          items: const [
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
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Biceps'),
                          isExpanded: true,
                          items: const [
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
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Chest'),
                          isExpanded: true,
                          items: const [
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
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Forearms'),
                          isExpanded: true,
                          items: const [
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
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Glutes'),
                          isExpanded: true,
                          items: const [
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
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Hamstrings'),
                          isExpanded: true,
                          items: const [
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
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Lower legs'),
                          isExpanded: true,
                          items: const [
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
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Quads'),
                          isExpanded: true,
                          items: const [
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
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Shoulders'),
                          isExpanded: true,
                          items: const [
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
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Triceps'),
                          isExpanded: true,
                          items: const [
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

              ) ,
            ),
            Card(
              color: Colors.white10,
              child: SizedBox(
                //height: 70,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left:10,right:10),
                        child: DropdownButton(
                          hint: const Text('Cardio'),
                          isExpanded: true,
                          items: const [
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
