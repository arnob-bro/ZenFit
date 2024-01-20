import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/UI/homepage.dart';

import '../Service/Database.dart';

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


/*  Future signInToFirebase() async {
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
*/
  Future signInToFirebase() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
    } catch (e){
      return e.toString();
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
                              onPressed: () async {
                                dynamic result = await signInToFirebase();
                                if (result is! UserCredential){
                                  //escape loading phase
                                  Navigator.of(context).pop();
                                  //showing the problem in login

                                  if(result== '[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.'){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            // content: Text("Login failed, try again !")
                                            content: Text("Invalid Email/Password"),
                                        )
                                    );
                                  }
                                  else if(result== '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.'){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          // content: Text("Login failed, try again !")
                                          content: Text("We have blocked all requests from this device due to unusual activity. Try again later."),
                                        )
                                    );
                                  }
                                  else if(result== '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.'){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          // content: Text("Login failed, try again !")
                                          content: Text("Please check your Internet Connection"),
                                        )
                                    );
                                  }
                                  else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            // content: Text("Login failed, try again !")
                                            content: Text("$result")
                                        )
                                    );
                                  }
                                }
                                else if(result is UserCredential){
                                  //DatabaseService().updateActiveStatus(true);
                                  //escape loading phase
                                  Navigator.of(context).pop();
                                  //showing login successful
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Log in successfull")));
                                  //routing to homepage
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const Home()));
                                }

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