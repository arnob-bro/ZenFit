import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/calculators.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/account.dart';
import 'package:zenfit/UI/welcome.dart';
import 'package:zenfit/UI/startWorkout.dart';

class settings extends StatefulWidget{
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}
class _settingsState extends State<settings> {
  bool isCardVisible= false;

  void navigateTostartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => startWorkout(workouttime: DateTime.now().millisecondsSinceEpoch.toString(),)),
    );
  }
  @override
  Widget build (BuildContext context) {
    return GestureDetector(
      onTap: () { setState(() {isCardVisible = false;
      });
      },
      child: Scaffold(

        backgroundColor: Colors.black,

        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back),color: Colors.white),
          backgroundColor: const Color.fromRGBO(23, 23, 23, 9),

          //backgroundColor: const Color.fromRGBO(15, 15, 15, 9),
        ),
        body: ListView(
          children: [
            /*Card(
              child: ListTile(
                title: const Text("Account"),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Account()),
                  );
                }
              ),
            ),*/



            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Account()),
                  );

                },

                child: Container(
                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(15, 15, 15, 9),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(

                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white70,
                            size: 30,
                          ),
                        ),
                        Expanded(child:Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Account",
                            style: TextStyle(
                              color: Colors.white70,
                              //fontWeight: FontWeight.w900,
                              //fontStyle: FontStyle.italic,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 5),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white70,
                            size: 20,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),

            Divider(
              height: 1,
              color: Colors.white10,
              thickness: .5,
            ),



            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Calculators()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(15, 15, 15, 9),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(

                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.calculate_outlined,
                            color: Colors.white70,
                            size: 30,
                          ),
                        ),
                        Expanded(child:Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Calculators",
                            style: TextStyle(
                              color: Colors.white70,
                              //fontWeight: FontWeight.w900,
                              //fontStyle: FontStyle.italic,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 5),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white70,
                            size: 20,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),





            /*Card(
              child: ListTile(
                title: const Text("Calculators"),
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Calculators()),
                  );
                }
              ),
            ),*/

            Divider(
              height: 1,
              color: Colors.white10,
              thickness: .5,
            ),


            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 8),
              child: InkWell(
                onTap: () {
                  DatabaseService.updateActiveStatus(false);
                  SignOut();
                },
                child: Container(
                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(15, 15, 15, 9),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(

                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.logout,
                            color: Colors.white70,
                            size: 30,
                          ),
                        ),
                        Expanded(child:Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Log out",
                            style: TextStyle(
                              color: Colors.white70,
                              //fontWeight: FontWeight.w900,
                              //fontStyle: FontStyle.italic,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 5),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white70,
                            size: 20,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),





            /* Card(
              child: ListTile(
                title: const Text("Log out"),
                onTap: (){
                  DatabaseService.updateActiveStatus(false);
                  SignOut();

                },
              ),
            ),*/
          ],
        ),

          bottomNavigationBar: BottomAppBar(
            shadowColor: Colors.black,
            surfaceTintColor: Colors.black,
            elevation: 20,
            height: 60,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed:(){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                }, icon: const Icon(Icons.home,color: Colors.white)),
                IconButton(onPressed:(){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Graph()),
                  );

                }, icon: const Icon(Icons.show_chart,color: Colors.white)),
                IconButton(onPressed:(){
                  setState(() {
                    isCardVisible = true;
                  });

                }, icon: const Icon(Icons.add_circle_outlined,color: Colors.white,)),
                IconButton(onPressed:(){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TrainingProgram()),
                  );

                }, icon: const Icon(Icons.note_alt,color: Colors.white)),
                IconButton(onPressed:(){

                }, icon: const Icon(Icons.settings,color: Colors.red)),

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
  void SignOut()async{
    await FirebaseAuth.instance.signOut();
    Navigator.push(context,
      MaterialPageRoute(builder: (context) =>  const welcomePage()),
    );
  }
}