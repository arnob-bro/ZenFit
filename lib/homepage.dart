import 'package:flutter/material.dart';
import 'package:zenfit/account.dart';
import 'package:zenfit/body_measurement.dart';
import 'package:zenfit/settings.dart';
class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          actions: [
            IconButton(onPressed:(){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Body_Measurement()),
              );
            }, icon: const Icon(Icons.accessibility_rounded)),
          ],
          leading: IconButton(onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Account()),
            );

          }, icon: const Icon(Icons.person)),
        ),
        body: ListView(
          children:  [
            Card(
              child: ListTile(
                title: Text("Training Log"),
                onTap: (){

                }
              ),
            ),

            Card(
              child: ListTile(
                title: Text("My Goals"),
                  onTap: (){

                  }
              ),
            ),

            Card(
              child: ListTile(
                title: Text("Followed Programs"),
                  onTap: (){

                  }
              ),
            ),
          ],
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