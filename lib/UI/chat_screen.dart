import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Model/zenfit_user.dart';

import '../main.dart';

class ChatScreen extends StatefulWidget {

  final ZenFitUser user;
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          flexibleSpace: InkWell(
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: const Icon(Icons.arrow_back),color: Colors.white),
            
                ClipRRect(
                  borderRadius: BorderRadius.circular(mq.height * .03),
                  child: CachedNetworkImage(
                    width: mq.height * .05,
                    height: mq.height * .05,
                    imageUrl: widget.user.image,
                    errorWidget: ((context,url,error) => const CircleAvatar(child: Icon(CupertinoIcons.person))),
                  ),
                ),
            
                const SizedBox(width: 10,),
            
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.user.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
            
                    const Text("Last seen not available",
                      style: TextStyle(
                        fontSize: 13,
                        //fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: null,
                  builder: (context, snapshot){
              
                    switch(snapshot.connectionState){
                    //if data is loading
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        //return const Center(child: CircularProgressIndicator(),);
              
                    //if data is loaded
                      case ConnectionState.active:
                      case ConnectionState.done:
                        //final data = snapshot.data?.docs;
                        //list = data?.map((e) => ZenFitUser.fromJson(e.data())).toList() ?? [];
                         final list=[];
                        if(list.isNotEmpty){
                          return ListView.builder(
                              itemCount: list.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context,index){
                                return Text("Message: ${list[index]}",style: const TextStyle(color: Colors.white),);
                              }
                          );
                        }
                        else{
                          return const Center(child: Text("Say Hi!",style: TextStyle(color: Colors.white),));
                        }
                    }
                  }
              ),
            ),
            _chatInput(),
          ],
        ),
      ),
    );
  }
  Widget _chatInput(){
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.black12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.emoji_emotions,color: Color.fromRGBO(0, 148, 210, 8),)
                  ),
                  const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Type something...',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      )
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.image,color: Color.fromRGBO(0, 148, 210, 8),)
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.camera_alt_rounded,color: Color.fromRGBO(0, 148, 210, 8),)
                  ),
                  SizedBox(width: mq.width * .02,)
                ],
              ),
          ),
        ),

        MaterialButton(
          minWidth: 0,
          padding: EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 10),
          shape: const CircleBorder(),
          onPressed: (){},
          color: Colors.lightGreen,
          child: Icon(Icons.send,color: Colors.white,),
        )
      ],
    );
  }
}
