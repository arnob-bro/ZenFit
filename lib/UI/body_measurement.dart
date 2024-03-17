import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/workout%20programs/trainingProgram.dart';
import 'package:zenfit/UI/graphs/graph.dart';

class Body_Measurement extends StatefulWidget{
  const Body_Measurement({super.key});

  @override
  State<Body_Measurement> createState() => _Body_MeasurementState();
}

class _Body_MeasurementState extends State<Body_Measurement> {


  @override
  Widget build (BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff37393D),
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: const Text(
              "Body Measurement",
            style: TextStyle(
              color: Colors.white54,
            ),
          ),
          leading: IconButton(onPressed: (){
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          }, icon: const Icon(Icons.arrow_back),color: Colors.white),
        ),
        body: const Measurements(),
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

  final neckController = TextEditingController();
  final shouldersController = TextEditingController();
  final leftUpperArmController = TextEditingController();
  final rightUpperArmController = TextEditingController();
  final leftForearmController = TextEditingController();
  final rightForearmController = TextEditingController();
  final leftThighController = TextEditingController();
  final rightThighController = TextEditingController();
  final leftCalfController = TextEditingController();
  final rightCalfController = TextEditingController();
  final bodyWeightController = TextEditingController();
  final chestController = TextEditingController();
  final waistController = TextEditingController();
  final hipsController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    neckController.dispose();
    shouldersController.dispose();
    leftUpperArmController.dispose();
    rightUpperArmController.dispose();
    leftForearmController.dispose();
    rightForearmController.dispose();
    leftThighController.dispose();
    rightThighController.dispose();
    leftCalfController.dispose();
    rightCalfController.dispose();
    bodyWeightController.dispose();
    chestController.dispose();
    waistController.dispose();
    hipsController.dispose();
  }

  void writeBodyMeasurementsToDatabase()async{
    /*
    await DatabaseService.writeBodyMeasurements(
        neck: double.parse(neckController.text),
        shoulders: double.parse(shouldersController.text),
        leftUpperArm: double.parse(leftUpperArmController.text),
        rightUpperArm: double.parse(rightUpperArmController.text),
        leftForearm: double.parse(leftForearmController.text),
        rightForearm: double.parse(rightForearmController.text),
        leftThigh: double.parse(leftThighController.text),
        rightThigh: double.parse(rightThighController.text),
        leftCalf: double.parse(leftCalfController.text),
        rightCalf: double.parse(rightCalfController.text),
        bodyWeight: double.parse(bodyWeightController.text),
        chest: double.parse(chestController.text),
        waist: double.parse(waistController.text),
        hips: double.parse(hipsController.text),
        date: DateTime.now().millisecondsSinceEpoch
    );*/
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    DocumentReference measurement = await FirebaseFirestore.instance.collection("bodymeasurement").doc(DatabaseService.me.id);
    measurement.collection("bodyweight").doc(time).set({"data":double.parse(bodyWeightController.text)});
    measurement.collection("neck").doc(time).set({"data":double.parse(neckController.text)});
    measurement.collection("shoulders").doc(time).set({"data":double.parse(shouldersController.text)});
    measurement.collection("leftUpperArm").doc(time).set({"data":double.parse(leftUpperArmController.text)});
    measurement.collection("rightUpperArm").doc(time).set({"data":double.parse(rightUpperArmController.text)});
    measurement.collection("leftForearm").doc(time).set({"data":double.parse(leftForearmController.text)});
    measurement.collection("rightForearm").doc(time).set({"data":double.parse(rightForearmController.text)});
    measurement.collection("leftThigh").doc(time).set({"data":double.parse(leftThighController.text)});
    measurement.collection("rightThigh").doc(time).set({"data":double.parse(rightThighController.text)});
    measurement.collection("leftCalf").doc(time).set({"data":double.parse(leftCalfController.text)});
    measurement.collection("rightCalf").doc(time).set({"data":double.parse(rightCalfController.text)});
    measurement.collection("chest").doc(time).set({"data":double.parse(chestController.text)});
    measurement.collection("hips").doc(time).set({"data":double.parse(hipsController.text)});
    measurement.collection("waist").doc(time).set({"data":double.parse(waistController.text)});

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Submitted successfully")));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home()));
  }


  @override
  Widget build (BuildContext context) {
    return ListView(

      children: [

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: neckController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Neck',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: shouldersController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Shoulders',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        

       Row(
         children: [
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(10),
               child: TextFormField(
                 controller: leftUpperArmController,
                 keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   border: UnderlineInputBorder(),
                   suffixText: 'cm',
                   suffixStyle: TextStyle(color: Colors.white54),
                   labelText: 'Left Upper Arm',
                   labelStyle: TextStyle(
                     color: Colors.white54,
                   ),
                 ),
               ),
             ),
           ),

           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(10),
               child: TextFormField(
                 controller: rightUpperArmController,
                 keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   border: UnderlineInputBorder(),
                   suffixText: 'cm',
                   suffixStyle: TextStyle(color: Colors.white54),
                   labelText: 'Right Upper Arm',
                   labelStyle: TextStyle(
                     color: Colors.white54,
                   ),
                 ),
               ),
             ),
           ),
         ],
       ),

        
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: leftForearmController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Left Forearm',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: rightForearmController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Right Forearm',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: leftThighController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Left Thigh',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: rightThighController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Right Thigh',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: leftCalfController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Left Calf',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: rightCalfController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Right Calf',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: bodyWeightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'kg',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Body Weight',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: chestController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Chest',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: waistController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Waist',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: hipsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    suffixText: 'cm',
                    suffixStyle: TextStyle(color: Colors.white54),
                    labelText: 'Hips',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),


        const SizedBox(height: 11,),
        
        Center(
            child: MaterialButton(
              color: Colors.white54,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: (){
                writeBodyMeasurementsToDatabase();

              },
              child: const Text("Submit",style: TextStyle(color: Colors.black),)
            )
        )
      ],

    );
  }
}