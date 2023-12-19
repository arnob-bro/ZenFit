import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zenfit/UI/homepage.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({super.key});

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  void signUpToFirebase()async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign up complete")));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.black26,

          title: const Text(
            'Welcome!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),

          ),
        ),
      body: SafeArea(

        child: ListView(
          children: [
             const Padding(
                padding: EdgeInsets.only(top: 10,left: 10),
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 22.0,
                    //fontWeight: FontWeight.bold,

                  ),
                )
            ),

            const Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name (example: John Doe)',
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 10,left: 10),
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 22.0,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            const Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'User Name (example: john_doe)',
                ),
              ),
            ),

            const Padding(
                padding: EdgeInsets.only(top: 10,left: 10),
                child: Text(
                  'Birth Date',
                  style: TextStyle(
                    fontSize: 22.0,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            const Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Choose',
                ),
              ),
            ),

            const Padding(
                padding: EdgeInsets.only(top: 10,left: 10),
                child: Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 22.0,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            const Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Choose',
                ),
              ),
            ),

            const Padding(
                padding: EdgeInsets.only(top: 10,left: 10),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 22.0,
                    //fontWeight: FontWeight.bold,
                  ),
                )
            ),

            Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'write email',
                ),
                controller: emailController,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: TextField(
                controller: passController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'write password',
                ),
              ),
            ),

            TextButton(onPressed: (){
              signUpToFirebase();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
            }, child: const Text("Submit")),
          ],
       ),

      )

    );
  }
}
