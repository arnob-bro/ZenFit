import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/welcome.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({super.key});

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  late String name;
  late String username;
  late String email;
  late String pass;


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
    if(selectedGender == null) selectedGender = 'none';

    await DatabaseService.collectUserInfo(
      name: nameController.text,
      username: usernameController.text,
      birthDate: birthDate.toString().split(" ")[0],
      gender: selectedGender!,
      email: emailController.text.trim(),
      pass: passController.text.trim(),
      isOnline: false,
      image: 'https://firebasestorage.googleapis.com/v0/b/zenfit-e4c1f.appspot.com/o/person.png?alt=media&token=e19ef1d4-cf85-45d0-866a-fe0ca922450d',
      about: '',
      createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
      lastActive: DateTime.now().millisecondsSinceEpoch.toString(),
      pushToken: '',

    );
  }

  void signUpToFirebase()async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("Sign up complete"))));
      userDataToDatabase();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("weak password"))));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("This email is already in use"))));
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
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const welcomePage()));
          }, icon: const Icon(Icons.arrow_back),color: Colors.white),
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
            image: const AssetImage('assets/images/loginbg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black38.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
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
                  child: TextFormField(
                    controller: nameController,
                    onSaved: (val) => name = val ?? "",
                    validator: (val) => val != null && val.isNotEmpty ? null : "Required Name",
                    style: const TextStyle(color: Colors.black), // Set text color to black
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter your name',
                      hintStyle: const TextStyle(fontSize:18,color: Colors.black54), // Set hint text color
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
                  child: TextFormField(
                    controller: usernameController,
                    onSaved: (val) => username = val ?? "",
                    validator: (val) => val != null && val.isNotEmpty ? null : "Required Username",
                    style: const TextStyle(color: Colors.black), // Set text color to black
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter your username',
                      hintStyle: const TextStyle(fontSize:18,color: Colors.black54),// Set hint text color
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10,),
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
                                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(250, 95, 95, 1.0),),
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
                            padding: EdgeInsets.only(top: 10),
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
                              hint: const Text('Choose',style: TextStyle(color: Colors.white),),
                              dropdownColor: Colors.white54,

                              value: selectedGender,
                              items: const [
                                DropdownMenuItem(
                                  value: 'Man',
                                  child: Text('Man',style: TextStyle(color: Colors.white),),
                                ),
                                DropdownMenuItem(
                                  value: 'Woman',
                                  child: Text('Woman',style: TextStyle(color: Colors.white),),
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
                  child: TextFormField(
                    controller: emailController,
                    onSaved: (val) => email = val ?? "",
                    validator: (val) => val != null && val.isNotEmpty ? null : "Required Email",
                    style: const TextStyle(color: Colors.black), // Set text color to black
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(fontSize:18,color: Colors.black54),
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
                  child: TextFormField(
                    controller: passController,
                    onSaved: (val) => pass = val ?? "",
                    validator: (val) => val != null && val.isNotEmpty ? null : "Required Password",
                    obscureText: true,
                    style: const TextStyle(color: Colors.black), // Set text color to black
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(fontSize:18,color: Colors.black54),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),

                  TextButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        signUpToFirebase();
                      }

                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(250, 95, 95, 5))),
                    child: const Text("Submit",style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
