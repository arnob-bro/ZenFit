import 'package:flutter/material.dart';
import 'package:zenfit/settings.dart';

class Body_Measurement extends StatefulWidget{
  const Body_Measurement({super.key});

  @override
  State<Body_Measurement> createState() => _Body_MeasurementState();
}

class _Body_MeasurementState extends State<Body_Measurement> {
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Body Measurement"),
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

            }, icon: const Icon(Icons.home)),
            IconButton(onPressed:(){

            }, icon: const Icon(Icons.show_chart)),
            IconButton(onPressed:(){

            }, icon: const Icon(Icons.add_circle_outlined)),
            IconButton(onPressed:(){

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
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Body Weight',
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Neck',
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Shoulders',
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Left Upper Arm',
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Right Upper Arm',
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Left Forearm',
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Right Forearm',
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Chest',
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Waist',
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Hips',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Left Thigh',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Right Thigh',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Left Calf',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Right Calf',
            ),
          ),
        ),
      ],
    );
  }
}