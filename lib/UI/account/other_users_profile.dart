import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Model/zenfit_user.dart';
import 'package:zenfit/UI/graphs/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/workout%20programs/trainingProgram.dart';
import 'package:zenfit/UI/startWorkout.dart';
import 'package:zenfit/helper/my_date_util.dart';

import '../../Service/Database.dart';
import '../../main.dart';

class UsersProfile extends StatefulWidget{
  final ZenFitUser user;
  const UsersProfile({super.key, required this.user});

  @override
  State<UsersProfile> createState() => _UsersProfileState();
}

class _UsersProfileState extends State<UsersProfile> {
  final _formKey = GlobalKey<FormState>();
  late String workoutName;
  bool isCardVisible= false;

  void navigateTostartWorkout() {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            contentPadding: const EdgeInsets.only(left: 24,right: 24,top: 20,bottom: 10),
            backgroundColor: Colors.blueGrey,
            title: const Text('Create Program',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.center,),
            content: SizedBox(
              height: 100,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Name',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          initialValue: 'New Workout',
                          onSaved: (val) => workoutName = val ?? "",
                          validator: (val) => val != null && val.isNotEmpty ? null : "Required program name",
                          cursorColor: Colors.white,
                          cursorHeight: 18,
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 1),
                          maxLines: 1,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                  ),

                  TextButton(onPressed: ()async{
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      String time = DateTime.now().millisecondsSinceEpoch.toString();
                      await FirebaseFirestore.instance.collection('traininglog').doc(DatabaseService.user.uid).collection("workout").doc(time).set({'name': workoutName,"time": time});
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => startWorkout(workouttime: time,workoutName: workoutName,category: "startworkout", programName: '', weektime: '',)),
                      );
                    }
                  },
                      child: const Text("Start Workout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)
                  )
                ],
              )

            ],
          );
        }
    );

  }
  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: () {
        setState(() {isCardVisible = false;
        });
      },
      child: Scaffold(



        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "${widget.user.name}'s Profile",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ProfileDetails(user: widget.user,),

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
                    color: const Color.fromRGBO(250, 95, 95, 5),
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
}

class ProfileDetails extends StatefulWidget {
  final ZenFitUser user;
  const ProfileDetails({super.key, required this.user});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(mq.height * .8),
                child: CachedNetworkImage(
                  width: mq.height * .15,
                  height: mq.height * .15,
                  fit: BoxFit.cover,
                  imageUrl: widget.user.image,
                  errorWidget: (context,url,error)=> const CircleAvatar(child: Icon(CupertinoIcons.person),),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(child: Text("Profile Information",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),),
            const Divider(),
            const SizedBox(height: 5,),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Name :',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(widget.user.name,style: const TextStyle(fontSize: 18),),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Username : ',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(widget.user.username,style: const TextStyle(fontSize: 18),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Birth Date : ',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(widget.user.birthDate,style: const TextStyle(fontSize: 18),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Gender : ',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(widget.user.gender,style: const TextStyle(fontSize: 18),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'About : ',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(widget.user.about,style: const TextStyle(fontSize: 18),),
              ),
            ),

            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Joined on: ',style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500),),
                Text(MyDateUtil().getLastMessageTime(context: context, time: widget.user.createdAt, showYear: true))
              ],
            ),
          ],
        ),
      ),
    );
  }
}


