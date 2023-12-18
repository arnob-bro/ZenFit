import 'package:flutter/material.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({super.key});

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,

        title: const Text(
          'Welcome!',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),

        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Name',
                style: TextStyle(
                  fontSize: 22.0,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name (example: John Doe)',
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'User Name',
                style: TextStyle(
                  fontSize: 22.0,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'User Name (example: @john_doe)',
              ),
            ),
          ),

          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Birth Date',
                style: TextStyle(
                  fontSize: 22.0,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Choose',
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Sex',
                style: TextStyle(
                  fontSize: 22.0,
                  //fontWeight: FontWeight.bold,
                ),
              )
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Choose',
              ),
            ),
          ),
        ],
      ),



    );
  }
}
