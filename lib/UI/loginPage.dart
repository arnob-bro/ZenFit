import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/UI/homepage.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final emailController = TextEditingController();
  final passController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }


  void signInToFirebase()async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Log in successfull")));
      setState(() {});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

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
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 22.0,
                        //fontWeight: FontWeight.bold,
                      ),
                    )
                ),

                Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
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
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: TextField(
                    controller: passController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'write password',
                    ),
                  ),
                ),

              if(user != null)
              TextButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));  }, child: Text("Go to homepage")),


              if(user==null)
              TextButton(onPressed: () {
                 signInToFirebase();
              }, child: const Text("Login")
              ),



            ],
          ),

        )

    );
  }
}
