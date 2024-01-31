import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/startWorkout.dart';

class StrengthGraph extends StatefulWidget {
  const StrengthGraph({Key? key}) : super(key: key);

  @override
  State<StrengthGraph> createState() => _StrengthGraphState();
}

class _StrengthGraphState extends State<StrengthGraph> {
  bool isCardVisible = false;

  void navigateToStartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => startWorkout(workouttime: DateTime.now().millisecondsSinceEpoch.toString(),)),
    );
  }
  // Replace with database-related code to fetch data
  List<DataPoint> fetchDataFromDatabase() {
    // database fetching logic here
    // Return a list of DataPoint objects
    // Each DataPoint should have an x and y value
    return [
      DataPoint(0, 2),
      DataPoint(1, 4),
      DataPoint(2, 8),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCardVisible = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Strength Graph",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back),color: Colors.white),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "Measurement (cm)",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10),
                  Transform.scale(
                    scale: 12.8, // Adjust the scale factor as needed
                    child: Icon(
                      Icons.arrow_upward,
                      size: 2,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 500, // Adjust the width as needed
                      height: 500, // Adjust the height as needed
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: LineChart(
                          LineChartData(
                            borderData: FlBorderData(
                              show: true,
                              border: Border.all(
                                color: const Color(0xFF37434D),
                                width: 1,
                              ),
                            ),
                            minX: 0,
                            maxX: 10,
                            minY: 0,
                            maxY: 10,
                            lineBarsData: [
                              LineChartBarData(
                                spots: fetchDataFromDatabase().map((dataPoint) {
                                  return FlSpot(
                                      dataPoint.x.toDouble(),
                                      dataPoint.y.toDouble());
                                }).toList(),
                                isCurved: true,
                                color: Colors.blue,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(show: false),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Transform.scale(
                    scale: 12.8,
                    child: Icon(
                      Icons.arrow_forward,
                      size: 2,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Time (days)",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
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
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  icon: const Icon(Icons.home)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Graph()),
                    );
                  },
                  icon: const Icon(Icons.show_chart)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isCardVisible = !isCardVisible;
                    });
                  },
                  icon: const Icon(Icons.add_circle_outlined)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TrainingProgram()),
                    );
                  },
                  icon: const Icon(Icons.note_alt)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const settings()),
                    );
                  },
                  icon: const Icon(Icons.settings)),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: isCardVisible
            ? Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                height: 120,
                color: Colors.transparent,
                child: Center(
                  child: Card(
                    color: Color.fromRGBO(250, 95, 95, 5),
                    child: InkWell(
                      onTap: () {
                        print("tapped");
                        navigateToStartWorkout();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.fitness_center,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Start a new workout',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
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

class DataPoint {
  final double x;
  final double y;

  DataPoint(this.x, this.y);
}