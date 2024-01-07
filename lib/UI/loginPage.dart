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


  void signInToFirebase() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Log in successfull")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('===========================No user found for that email.');
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("No user in this email"))));

      } else if (e.code == 'wrong-password') {
        print('=========================Wrong password provided for that user.');
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("Wrong Password"))));
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back),color: Colors.white),
        title: const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
          ),

        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/loginbg.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black38.withOpacity(0.4), BlendMode.dstATop),
            )
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10,bottom: 10),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        //fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(

                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        hintText: 'Enter your email',
                        hintStyle: const TextStyle(color: Colors.black54),

                      ),
                      controller: emailController,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15, left: 10,bottom: 10),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        //fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 10,right: 10),
                    child: const Text(
                        "Forget Password?",
                      style: TextStyle(
                        color: Colors.white,

                      ),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                signInToFirebase();
                              },
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(250, 95, 95, 5))),
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}