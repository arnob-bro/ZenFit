import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/welcome.dart';
import 'firebase_options.dart';

late Size mq;

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    super.initState();
    DatabaseService().getSelfInfo();
  }
   @override
  Widget build (BuildContext context) {
     bool isLoggedIn= false;
     final user = FirebaseAuth.instance.currentUser;
     if(user!=null) isLoggedIn = true;

     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: isLoggedIn ? const Home() : const welcomePage(),
       routes: {
          "home" : (context)=> const Home(),
     },
     );
   }
}