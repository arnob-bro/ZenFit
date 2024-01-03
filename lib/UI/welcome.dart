import 'package:flutter/material.dart';
import 'package:zenfit/UI/loginPage.dart';
import 'package:zenfit/UI/newlogin.dart';


class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff000000),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height:200.0,
                child: Image.asset(
                'assets/images/logo.png',
                width: 150.0,
                height: 200.0,
              ),
             ),
            ),
            Container(
              height: 40,
            ),
            Column(
              children: [
                const Text(
                  'Welcome! New user?',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: Card(
                    color: Color.fromRGBO(250, 95, 95, 5),
                    child: ListTile(
                        title: const Center(
                          child: Text(
                            'Start using ZenFit',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )
                        ),
                        ),
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const NewLogin()),
                          );

                        }
                    ),
                  ),
                ),
                Container(
                  height: 60,
                ),
                const Text(
                  'Returning user?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Card(
                    color: Color.fromRGBO(250, 95, 95, 5),
                    child: ListTile(
                        title: const Center(child: Text(
                            'Log in here',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,

                            )
                        ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const loginPage()));

                        }
                    ),
                  ),

                ),
                Container(
                  height: 60,
                ),
                const Text(
                  'ZenFit',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}
