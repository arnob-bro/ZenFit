import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zenfit/Model/zenfit_user.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/graph.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/settings.dart';
import 'package:zenfit/UI/trainingProgram.dart';
import 'package:zenfit/UI/startWorkout.dart';
import 'package:zenfit/main.dart';

import 'account.dart';

class UpdateAccount extends StatefulWidget{
  const UpdateAccount({super.key});

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  bool isCardVisible= false;

  void navigateTostartWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const startWorkout()),
    );
  }
  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: () { setState(() {isCardVisible = false;
      });
      },
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Update Account",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const UpdateAccountDetails(),
        /* body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/account.jpg'),
                    fit: BoxFit.cover,
                   // colorFilter: ColorFilter.mode(
                     //   Colors.black38.withOpacity(.8), BlendMode.dstATop),
                  )
              ),
            ),
            Positioned.fill(
              child: const AccountDetails(), // Replace with your actual content widget
            ),
          ],
        ),*/
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
                color: Colors.white,
                child: Center(
                  child: Card(
                    color: Colors.grey,

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
                              color: Colors.black, // Adjust the color as needed
                            ),
                            SizedBox(width: 10),
                            Text('Start a new workout', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.black),
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

class UpdateAccountDetails extends StatefulWidget {
  const UpdateAccountDetails({super.key});

  @override
  State<UpdateAccountDetails> createState() => _UpdateAccountDetailsState();
}

class _UpdateAccountDetailsState extends State<UpdateAccountDetails> {

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final birthDateController = TextEditingController();
  final genderController = TextEditingController();
  late String createdAt  =" ";
  late  String about =" ";
  late bool isOnline = false;
  late String lastActive = " ";
  late String pass = " ";
  String? _image;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    usernameController.dispose();
    birthDateController.dispose();
    genderController.dispose();
  }
  
  void _showBottomSheet(){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
        ),
        builder: (_){
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10,bottom: 15),
            children: [
              const Text("Pick Profile Picture",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(100,100),
                      shape: RoundedRectangleBorder(),
                    ),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick an image.
                        final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
                        if(image != null){
                          print("image path: ${image.path}");
                          setState(() {
                            _image = image.path;
                          });
                          DatabaseService().updateProfilePicture(File(_image!));
                          Navigator.pop(context);
                        }

                      },
                      child: Icon(Icons.add_photo_alternate_sharp)),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(100,100),
                        shape: RoundedRectangleBorder()
                      ),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick an image.
                        final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
                        if(image != null){
                          print("image path: ${image.path}");
                          setState(() {
                            _image = image.path;
                          });
                          DatabaseService().updateProfilePicture(File(_image!));
                          Navigator.pop(context);
                        }
                      },
                      child: Icon(Icons.add_a_photo_sharp)),
                ],
              )
            ],
          );
        },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(24),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _image != null ?
                  ClipRRect(
                    borderRadius: BorderRadius.circular(mq.height * .8),
                    child: Image.file(
                      File(_image!),
                      width: mq.height * .15,
                      height: mq.height * .15,
                      fit: BoxFit.cover,
                    ),
                  )
                  :
                  ClipRRect(
                    borderRadius: BorderRadius.circular(mq.height * .1),
                    child: const CircleAvatar(
                      radius: 60,
                      child: Icon(CupertinoIcons.person),
                    ),
                  ),

                Positioned(
                  right: 0,
                  bottom: 0,
                    child: IconButton(
                        onPressed: (){
                          _showBottomSheet();
                        },
                        icon: const Icon(Icons.add_a_photo_sharp)
                    )
                ),
              ],
            ),
            const Center(child: Text("Profile Information",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),),
            const Divider(),
            const SizedBox(height: 5,),
            FutureBuilder<DocumentSnapshot>(
              future: DatabaseService().readUserInfo().doc(FirebaseAuth.instance.currentUser?.uid).get(),
              builder:
                  (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting){
                  return const LinearProgressIndicator();
                }

                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if(snapshot.data == null){
                  return const Text("No data");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

                  about = data['about'];
                  createdAt = data['createdAt'];
                  isOnline = data['isOnline'];
                  lastActive = data['lastActive'];
                  pass = data['pass'];

                  //return Text("Full Name: ${data['name']}");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Name :',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      /*Card(
                        child: ListTile(
                          title: Text("${data['name']}",style: const TextStyle(fontSize: 18),),
                        ),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8,top: 8),
                        child: TextFormField(
                          initialValue: data['name'],
                          //controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            )
                          ),
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
                      /*Card(
                        child: ListTile(
                          title: Text('${data['username']}',style: const TextStyle(fontSize: 18),),
                        ),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8,top: 8),
                        child: TextFormField(
                          initialValue: data['username'],
                          //controller: usernameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
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
                      /*Card(
                        child: ListTile(
                          title: Text('${data['birthDate'].toString()}',style: const TextStyle(fontSize: 18),),
                        ),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8,top: 8),
                        child: TextFormField(
                          initialValue: data['birthDate'],
                          //controller: birthDateController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
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
                      /*Card(
                        child: ListTile(
                          title: Text('${data['gender']}',style: const TextStyle(fontSize: 18),),
                        ),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8,top: 8),
                        child: TextFormField(
                          initialValue: data['gender'],
                          //controller: genderController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                      ),

                      const SizedBox(height: 10,),

                      Center(child: MaterialButton(onPressed: ()async{
                        ZenFitUser zenfituser = ZenFitUser(
                            image: " ",
                            about: " ",
                            name: nameController.text,
                            createdAt: createdAt,
                            isOnline: isOnline,
                            email: FirebaseAuth.instance.currentUser!.email.toString(),
                            id: FirebaseAuth.instance.currentUser!.uid,
                            lastActive: lastActive,
                            pushToken: " ",
                            pass: pass,
                            birthDate: birthDateController.text,
                            gender: genderController.text,
                            username: usernameController.text
                        );
                        await DatabaseService().updateAccountDetails(zenfituser);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Account()));
                      },
                        height: 30,color: Colors.lightBlue,shape: const StadiumBorder(),child:const Text("Confirm update") ,))

                    ],
                  );
                }

                return const Text("loading");
              },
            )
          ],
        ),
      ),
    );
  }
}


