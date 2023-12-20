import 'package:flutter/material.dart';
import 'package:zenfit/UI/account.dart';
import 'package:zenfit/UI/body_measurement.dart';
import 'package:zenfit/UI/followedPrograms.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/myGoals.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build (BuildContext context){
    return WillPopScope(
      child: Scaffold(
          backgroundColor: Color(0xff37393D),
          appBar: AppBar(
            backgroundColor: Colors.black12,
            actions: [
             ElevatedButton(onPressed: (){
               Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const Body_Measurement()),
               );
             },
               style: ElevatedButton.styleFrom(
                 shape: const CircleBorder(),
                 side: const BorderSide(width: 3),
               ),
               child: const Icon(Icons.accessibility_sharp,color: Color(0xff37393D),),
             )

            ],
            leading: IconButton(onPressed:(){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Account()),
              );

            }, icon: const Icon(Icons.person_sharp)),
          ),
          body: SafeArea(
            child: ListView(
              children:  [
                Card(
                  child: ListTile(
                    title: const Text("Training Log"),
                    onTap: (){
      
                    }
                  ),
                ),
      
                Card(
                  child: ListTile(
                    title: const Text("My Goals"),
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => My_Goals()),
                        );
                      }
                  ),
                ),
      
                Card(
                  child: ListTile(
                    title: const Text("Followed Programs"),
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Followed_Programs()),
                        );
                      }
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
      ),
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
            Text('Home Screen'),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      },
    );
  }
}