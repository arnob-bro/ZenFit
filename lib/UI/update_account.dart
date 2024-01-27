import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zenfit/Model/zenfit_user.dart';
import 'package:zenfit/Service/Database.dart';
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
      onTap: ()=> FocusScope.of(context).unfocus(),
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
  final _formKey = GlobalKey<FormState>();
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
                          DatabaseService.updateProfilePicture(File(_image!));
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
                          DatabaseService.updateProfilePicture(File(_image!));
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
                  borderRadius: BorderRadius.circular(mq.height * .8),
                  child: CachedNetworkImage(
                    width: mq.height * .15,
                    height: mq.height * .15,
                    fit: BoxFit.cover,
                    imageUrl: DatabaseService.me.image,
                    errorWidget: (context,url,error)=> const CircleAvatar(child: Icon(CupertinoIcons.person),),
                  ),
                ),

                Positioned(
                  right: 0,
                  bottom: 0,
                    child: IconButton(
                        onPressed: (){
                          _showBottomSheet();
                        },
                        icon: const Icon(Icons.add_a_photo_sharp,color: Colors.grey,)
                    )
                ),
              ],
            ),
            const Center(child: Text("Profile Information",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),),
            const Divider(),
            const SizedBox(height: 5,),
    Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Name :',
              style: TextStyle(
              fontSize: 18.0,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8,top: 8),
            child: TextFormField(
              initialValue: DatabaseService.me.name,
              onSaved: (val) => DatabaseService.me.name = val ?? "",
              validator: (val) => val != null && val.isNotEmpty ? null : "Required Name",
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
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8,top: 8),
            child: TextFormField(
            initialValue: DatabaseService.me.username,
            onSaved: (val) => DatabaseService.me.username = val ?? "",
            validator: (val) => val != null && val.isNotEmpty ? null : "Required Username",
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
              'BirthDate : ',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8,top: 8),
            child: TextFormField(
              initialValue: DatabaseService.me.birthDate,
              onSaved: (val) => DatabaseService.me.birthDate = val ?? "",
              validator: (val) => val != null && val.isNotEmpty ? null : "Required BirthDate",
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8,top: 8),
            child: TextFormField(
              initialValue: DatabaseService.me.gender,
              onSaved: (val) => DatabaseService.me.gender = val ?? "",
              validator: (val) => val != null && val.isNotEmpty ? null : "Required Gender",
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Center(child: MaterialButton(
            onPressed: ()async{
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                await DatabaseService.updateAccountDetails();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Account()));
              }
            },
            height: 30,color: Colors.lightBlue,shape: const StadiumBorder(),child:const Text("Confirm update") ,))

        ],
      ),
    )
          ],
        ),
      ),
    );
  }
}


