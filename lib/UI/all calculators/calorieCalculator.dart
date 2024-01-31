import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/startWorkout.dart';

class Calorie_Calculator extends StatefulWidget {
  const Calorie_Calculator({super.key});

  @override
  State<Calorie_Calculator> createState() => _Calorie_CalculatorState();
}

class _Calorie_CalculatorState extends State<Calorie_Calculator> {
  bool isCardVisible= false;

  void navigateTostartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => startWorkout(workouttime: DateTime.now().millisecondsSinceEpoch.toString(),)),
    );
  }
  int? selectedValue;
  int? selectedGender;
  bool isCalculated =false;
  double? calorie;
  final weightController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();

  void calculateCalorie(){
    double constant=0;
    double weight,age,height;

    weight = double.parse(weightController.text);
    age = double.parse(ageController.text);
    height = double.parse(heightController.text);

    if(selectedValue == 1) {
      constant = 1.2;
    } else if(selectedValue == 2)
      {
        constant =1.37;
      }
    else if(selectedValue == 3)
      {
        constant =1.465;
      }
    else if(selectedValue == 4)
      {
        constant =1.725;
      }
    else if(selectedValue == 5)
    {
      constant = 1.9;
    }
      if(selectedGender == 1)
      {
         double calorie = constant*(10*weight + 6.25*height - 5*age +5);
         setState(() {
           this.calorie=calorie;
           isCalculated = true;
         });

      }
      else
      {
        double calorie = constant*(10*weight + 6.25*height - 5*age -161);
        setState(() {
          this.calorie=calorie;
          isCalculated = true;
        });
      }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    weightController.dispose();
    ageController.dispose();
    heightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { setState(() {isCardVisible = false;
      });
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
              "Calorie Calculator",
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
                    'Estimated daily requirement',
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
                          child: isCalculated ? Center(child: Text("$calorie kcal",style: const TextStyle(fontSize: 22.0,color: Colors.white54,),)) : const Center(child: Text("00 kcal",style: TextStyle(fontSize: 22.0,color: Colors.white54,),)),
                ),
              ),
              Card(
                color: Colors.white10,
                child:SizedBox(
                  height: 290,
                  child: Row(
                    children: [
                        Expanded(
                          child: Column(
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
                                      width: 170,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
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

                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Height',
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
                                        padding: const EdgeInsets.all(10),
                                        child: TextField(
                                          controller: heightController,
                                          style: const TextStyle(color: Colors.white54),
                                          keyboardType: TextInputType.number,
                                          cursorHeight: 18,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            suffixText: "cm",
                                            suffixStyle: TextStyle(color: Colors.white54,),

                                          ),
                                        ),
                                      ),
                                    )
                                ),

                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Training days/week',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),

                                Padding(
                                    padding: const EdgeInsets.only( left: 10,right: 10),
                                    child: DropdownButton(

                                      hint: const Text('Choose',style: TextStyle(color: Colors.white54),),
                                      dropdownColor: const Color.fromRGBO(88, 85, 94, 8),
                                      value: selectedValue,
                                      items: const [
                                        DropdownMenuItem(
                                          value: 1,
                                          child: Text('Little/None',style: TextStyle(color: Colors.white54),),
                                        ),
                                        DropdownMenuItem(
                                          value: 2,
                                          child: Text('1-3',style: TextStyle(color: Colors.white54),),
                                        ),
                                        DropdownMenuItem(
                                          value: 3,
                                          child: Text('4-5',style: TextStyle(color: Colors.white54),),
                                        ),
                                        DropdownMenuItem(
                                          value: 4,
                                          child: Text('6-7',style: TextStyle(color: Colors.white54),),
                                        ),
                                        DropdownMenuItem(
                                          value: 5,
                                          child: Text('2 times/day',style: TextStyle(color: Colors.white54),),
                                        )
                                      ],
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          selectedValue = newValue;
                                        }
                                        );
                                      },
                                    ),
                                ),
                            ],
                          ),
                        ),

                      Expanded(
                        child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Age',
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
                                      padding: const EdgeInsets.all(10),
                                      child: TextField(
                                        controller: ageController,
                                        style: const TextStyle(color: Colors.white54),
                                        keyboardType: TextInputType.number,
                                        cursorHeight: 18,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          suffixText: "year",
                                          suffixStyle: TextStyle(color: Colors.white54,),
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white54,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only( left: 10,right: 10),
                                  child: DropdownButton(
                                    dropdownColor: const Color.fromRGBO(88, 85, 94, 8),
                                    hint: const Text('Choose',style: TextStyle(color: Colors.white54),),
                                    value: selectedGender,

                                    items: const [
                                      DropdownMenuItem(
                                        value: 1,
                                        child: Text('Man',style: TextStyle(color: Colors.white54),),
                                      ),
                                      DropdownMenuItem(
                                        value: 2,
                                        child: Text('Woman',style: TextStyle(color: Colors.white54),),
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
              Padding(
                padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          calculateCalorie();
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
                  isCardVisible = !isCardVisible;
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
                        print("tapped");
                        navigateTostartWorkout();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
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
