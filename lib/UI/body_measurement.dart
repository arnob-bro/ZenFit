import 'package:flutter/material.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/graph.dart';

class Body_Measurement extends StatefulWidget{
  const Body_Measurement({super.key});

  @override
  State<Body_Measurement> createState() => _Body_MeasurementState();
}

class _Body_MeasurementState extends State<Body_Measurement> {
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xff37393D),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
            "Body Measurement",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
      ),
      body: const Measurements(),
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

class Measurements extends StatefulWidget{
  const Measurements({super.key});

  @override
  State<Measurements> createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {
  @override
  Widget build (BuildContext context) {
    return ListView(

      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Body Weight',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Neck',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Shoulders',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Left Upper Arm',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Right Upper Arm',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Left Forearm',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Right Forearm',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Chest',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Waist',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Hips',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Left Thigh',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Right Thigh',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Left Calf',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Right Calf',
              labelStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}