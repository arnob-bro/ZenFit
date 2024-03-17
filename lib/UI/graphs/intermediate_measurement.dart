import 'package:flutter/material.dart';
import 'package:zenfit/UI/graphs/graph.dart';
import 'package:zenfit/UI/graphs/measurementGraph.dart';


class Intermediate_measurement extends StatelessWidget {
  const Intermediate_measurement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const Graph()));
        }, icon: const Icon(Icons.arrow_back),color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text("Choose",style: TextStyle(color: Colors.white54),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [

            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Bodyweight"),
                  onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'bodyweight',)));
                     }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Chest"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'chest',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Hips"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'hips',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Left Calf"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'leftCalf',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Left Forearm"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'leftForearm',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Left Thigh"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'leftThigh',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Left Upper Arm"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'leftUpperArm',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Neck"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'neck',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Right Calf"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'rightCalf',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Right Forearm"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'rightForearm',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Right Thigh"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'rightThigh',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Right Upper Arm"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'rightUpperArm',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Shoulders"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'shoulders',)));
                  }
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                  textColor: Colors.white,
                  title: const Text("Waist"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MeasurementGraph(field: 'waist',)));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
