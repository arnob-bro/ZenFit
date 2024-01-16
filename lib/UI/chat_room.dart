import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/Widgets/chat_user_card.dart';

import '../Model/zenfit_user.dart';

class Chat_Room extends StatefulWidget {
  const Chat_Room({super.key});

  @override
  State<Chat_Room> createState() => _Chat_RoomState();
}

class _Chat_RoomState extends State<Chat_Room> {

  List<ZenFitUser> list =[];
  final List<ZenFitUser> _searchList = [];
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        if(_isSearching){
          setState(() {
            _isSearching = !_isSearching;
          });
          return Future.value(false);
        }else{
          return Future.value(true);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: _isSearching
              ? TextField(
            autofocus: true,
            onChanged: (val){
              //search logic
              _searchList.clear();
              for(var i in list){
                if(i.name.toLowerCase().contains(val.toLowerCase())){
                  _searchList.add(i);
                }
                setState(() {
                  _searchList;
                });
              }
            },
            style: const TextStyle(color: Colors.white,fontSize: 17,letterSpacing: 0.5),
            decoration: const InputDecoration(
              border: InputBorder.none,hintText: 'Name',hintStyle: TextStyle(color: Colors.white38),
            ),
          )
              : const Text("Chat Room",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
            }, icon: const Icon(Icons.arrow_back),color: Colors.white),
          actions: [
            IconButton(onPressed: (){
              setState(() {
                _isSearching = !_isSearching;
              });
            }, icon: Icon( _isSearching ? CupertinoIcons.clear_circled_solid : Icons.search,color: Colors.white,)),
          ],
        ),
        body: StreamBuilder(
          stream: DatabaseService().getAllUsers(),
          builder: (context, snapshot){

            switch(snapshot.connectionState){
              //if data is loading
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator(),);

              //if data is loaded
              case ConnectionState.active:
              case ConnectionState.done:
                final data = snapshot.data?.docs;
                list = data?.map((e) => ZenFitUser.fromJson(e.data())).toList() ?? [];
                if(list.isNotEmpty){
                  return ListView.builder(
                      itemCount: _isSearching? _searchList.length  : list.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return ChatUserCard(user: _isSearching? _searchList[index] : list[index]);
                      }
                  );
                }
                else{
                  return const Center(child: Text("No Connection Found",style: TextStyle(color: Colors.white),));
                }
              }
          }
        ),
      ),
    );
  }
}


//17 no video dkhsi