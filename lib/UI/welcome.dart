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
        backgroundColor: const Color(0xff37393D),

        body:Column(
          children: [
            Container(
              height: 400,

            ),
            Column(
              children: [
                const Text(
                  'Welcome! New user?',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: Card(
                    child: ListTile(
                        title: const Center(
                          child: Text(
                            'Start using ZenFit',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
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
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Card(
                    child: ListTile(
                        title: const Center(child: Text(
                            'Log in here',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,

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
