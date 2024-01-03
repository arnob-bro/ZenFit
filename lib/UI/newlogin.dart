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
      email: emailController.text.trim(),
      pass: passController.text.trim(),

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
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text(
          'Welcome!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginbg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black38.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.black), // Set text color to black
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Name (example: John Doe)',
                    hintStyle: TextStyle(fontSize:18,color: Colors.black54), // Set hint text color
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                  controller: usernameController,
                  style: TextStyle(color: Colors.black), // Set text color to black
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'User Name (example: john_doe)',
                    hintStyle: TextStyle(fontSize:18,color: Colors.black54),// Set hint text color
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Birth Date',
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                          child: ElevatedButton(
                            onPressed: _showDatePicker,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(250, 95, 95, 1.0),),
                            ),
                            child: isBirthdateSelected
                                ? Text(birthDate.toString().split(" ")[0])
                                : const Text(
                              "Choose Date",
                              style: TextStyle(fontSize:17,color: Colors.white),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
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
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.black), // Set text color to black
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'write email',
                    hintStyle: TextStyle(fontSize:18,color: Colors.black54),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                  controller: passController,
                  style: TextStyle(color: Colors.black), // Set text color to black
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'write password',
                    hintStyle: TextStyle(fontSize:18,color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    signUpToFirebase();
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(250, 95, 95, 5))),
                  child: const Text("Submit",style: TextStyle(fontSize: 20.0, color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
