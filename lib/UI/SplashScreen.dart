import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedSplashScreen(
          duration: 2000,
          splashIconSize: MediaQuery.of(context).size.height/1,
          splash: Container(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/2.5,
                ),
                Container(
                  height:MediaQuery.of(context).size.height/6.5,
                  child: Center(
                    child: Image.asset('assets/images/logo2.jpg'),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                Text(
                  "ZenFit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),

          nextScreen: Home(),
          //splashTransition: SplashTransition.fadeTransition,
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Color.fromRGBO(0, 0, 0, 9),
        ),
      ),
    );
  }
}
//Image.asset('assets/images/logo.jpg'),

