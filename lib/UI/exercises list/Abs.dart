import 'package:flutter/material.dart';

import '../../Exercise List/exercise_list.dart';

class Abs extends StatefulWidget {
  final String category;
  const Abs({super.key, required this.category});

  @override
  State<Abs> createState() => _AbsState();
}

class _AbsState extends State<Abs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff37393D),
      body: SafeArea(
        child: ListView.builder(
            itemCount: ab.length,
            itemBuilder: (context,index){
              return Card(
                color: Colors.white10,
                child: ListTile(
                    title: Text(ab[index],style: const TextStyle(color: Colors.white54),),
                    onTap: (){

                    }
                ),
              );
            }
      )
      )
    );
  }
}
