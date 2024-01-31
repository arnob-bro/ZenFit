import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/startWorkout.dart';
class RM_Calculator extends StatefulWidget {
  const RM_Calculator({super.key});

  @override
  State<RM_Calculator> createState() => _RM_CalculatorState();
}

class _RM_CalculatorState extends State<RM_Calculator> {
  bool isCardVisible= false;

  void navigateTostartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => startWorkout(workouttime: DateTime.now().millisecondsSinceEpoch.toString(),)),
    );
  }


  bool isCalculated = false;
  double? oneRM;
  final weightController = TextEditingController();
  final repsController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    weightController.dispose();
    repsController.dispose();
  }

  void calculate1RM(){
    double weight = double.parse(weightController.text.toString());
    int rep = int.parse(repsController.text.toString());

    if(rep == 1)
      {
        double oneRM = weight;
        setState(() {
          this.oneRM = oneRM;
          isCalculated =true;
        });
      }
    else if(rep == 2)
    {
      double oneRM = weight/0.97;
      setState(() {
        this.oneRM = oneRM;
        isCalculated =true;
      });
    }
    else if(rep == 3)
    {
      double oneRM = weight/.94;
      setState(() {
        this.oneRM = oneRM;
        isCalculated =true;
      });
    }
    else if(rep == 4)
    {
      double oneRM = weight/.92;
      setState(() {
        this.oneRM = oneRM;
        isCalculated =true;
      });
    }
    else if(rep == 5)
    {
      double oneRM = weight/.89;
      setState(() {
        this.oneRM = oneRM;
        isCalculated =true;
      });
    }
    else if(rep == 6)
    {
      double oneRM = weight/.86;
      setState(() {
        this.oneRM = oneRM;
        isCalculated =true;
      });
    }
    else if(rep == 7)
    {
      double oneRM = weight/.83;
      setState(() {
        this.oneRM = oneRM;
        isCalculated =true;
      });
    }
    else if(rep == 8)
    {
      double oneRM = weight/.81;
      setState(() {
        this.oneRM = oneRM;
        isCalculated =true;
      });
    }
    else if(rep == 9)
    {
      double oneRM = weight/.78;
      setState(() {
        this.oneRM = oneRM;
        isCalculated =true;
      });
    }
    else if(rep == 10)
    {
      double oneRM = weight/.75;
      setState(() {
        this.oneRM = oneRM;
        isCalculated =true;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { setState(() {
        isCardVisible = false;
      });
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
              "1RM Calculator",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back),color: Colors.white),
          backgroundColor: Colors.black,

        ),
        body: SafeArea(
          child: ListView(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    'Estimated 1RM',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white54,
                      //fontWeight: FontWeight.bold,
                    ),
                  )
              ),
               Card(
                color: Colors.white10,
                child: SizedBox(
                  height: 50,
                  child: isCalculated ? Center(child: Text("$oneRM kg",style: const TextStyle(fontSize: 22.0,color: Colors.white54,),)) : const Center(child: Text("00 kg",style: TextStyle(fontSize: 22.0,color: Colors.white54,),)),
                ),
              ),
              Card(
                color: Colors.white10,
                child: SizedBox(
                  height: 100,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Weight',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only( left: 10,right: 10),
                                child: SizedBox(
                                  height: 50,
                                  width: 165,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: TextField(
                                      controller: weightController,
                                      style: const TextStyle(color: Colors.white54),
                                        keyboardType: TextInputType.number,
                                        cursorHeight: 18,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          suffixText: "kg",
                                          suffixStyle: TextStyle(color: Colors.white54,),
                                        ),
                                      ),
                                  ),

                                )
                            ),

                          ],
                        ),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Reps',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only( left: 10,right: 10),
                                child: SizedBox(
                                  height: 50,
                                  width: 170,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: TextField(
                                      controller: repsController,
                                      style: const TextStyle(color: Colors.white54),
                                      keyboardType: TextInputType.number,
                                      cursorHeight: 18,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),

                ) ,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          calculate1RM();
                        },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(88, 95, 95, 5))),
                        child: const Text(
                          "Calculate",
                          style: TextStyle(fontSize: 18.0, color: Colors.white54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 11,),
              const Center(child: Text("Maximum reps can be 10",style: TextStyle(fontSize: 18.0,color: Colors.white54,),)),
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
                setState(() {
                  isCardVisible = true;
                });
              }, icon: const Icon(Icons.add_circle_outlined)),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: isCardVisible
            ? Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BackdropFilter( filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
              child: Container(
                height: 120,
                color: Colors.transparent,
                child: Center(
                  child: Card(
                    color: Color.fromRGBO(250, 95, 95, 5),
                    child: InkWell(
                      onTap: () {
                        isCardVisible =false;
                        navigateTostartWorkout();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fitness_center, // Choose the workout icon
                              size: 30.0,
                              color: Colors.white, // Adjust the color as needed
                            ),
                            SizedBox(width: 10),
                            Text('Start a new workout', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
            : null,
      ),
    );
  }
}
