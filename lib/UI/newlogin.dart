import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/homepage.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({super.key});

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  DateTime birthDate = DateTime.now();
  bool isBirthdateSelected = false;
  String? selectedGender;

  void _showDatePicker(){
    showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2100)).then((value){
      setState(() {
        birthDate = value!;
        isBirthdateSelected = true;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passController.dispose();
  }

  void userDataToDatabase() async {
    await DatabaseService().collectUserInfo(
      name: nameController.text,
      username: usernameController.text,
      birthDate: birthDate,
      gender: selectedGender!,
      email: emailController.text,
      pass: passController.text,

    );
  }

  void signUpToFirebase()async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: const Text("Sign up complete"))));
      userDataToDatabase();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: const Text("weak password"))));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: const Text("This email is already in use"))));
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

            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
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

            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'User Name (example: john_doe)',
                ),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
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
                  
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                        child: ElevatedButton(onPressed: _showDatePicker,
                          child: isBirthdateSelected ? Text(birthDate.toString().split(" ")[0]) : const Text("Choose Date"),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
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
                  
                      Padding(
                        padding: const EdgeInsets.only(right: 10,left: 10),
                        child: DropdownButton(

                          hint: const Text('Choose'),
                          dropdownColor: Colors.white54,
                          value: selectedGender,
                          items: const [
                            DropdownMenuItem(
                              value: 'Man',
                              child: Text('Man'),
                            ),
                            DropdownMenuItem(
                              value: 'Woman',
                              child: Text('Woman'),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGender = newValue;
                            }
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
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
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'write email',
                ),

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
              padding: const EdgeInsets.only(right: 10,left: 10),
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


            }, child: const Text("Submit")),
          ],
       ),

      )

    );
  }
}
