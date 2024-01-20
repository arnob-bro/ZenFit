import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/homepage.dart';
import 'package:zenfit/UI/welcome.dart';
import 'firebase_options.dart';

late Size mq;
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var result = await FlutterNotificationChannel.registerNotificationChannel(
      id: 'chats',
      name: 'Chats',
      description: 'For Showing Message Notifications',
      importance: NotificationImportance.IMPORTANCE_HIGH
  );
  print('\nNotification Cannhel Result: $result');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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