import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Model/zenfit_user.dart';

import '../UI/chat_screen.dart';
import '../main.dart';

class ChatUserCard extends StatefulWidget {

  final ZenFitUser user;

  const ChatUserCard({super .key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {


  @override
  Widget build(BuildContext context) {


    return Card(
      color: Colors.black,
      child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (_) => ChatScreen(user: widget.user,)));
        },
        child: ListTile(

          leading: (widget.user.image != 'null') ? ClipRRect(borderRadius: BorderRadius.circular(mq.height *.3),child: CachedNetworkImage(height: mq.height *.055, width: mq.height * .055, imageUrl: widget.user.image, /*placeholder: (context, url) => CircularProgressIndicator(),*/errorWidget: (context, url, error) => const CircleAvatar(child: Icon(CupertinoIcons.person)))) : const CircleAvatar(child: Icon(CupertinoIcons.person,)),
          title: Text(widget.user.name,style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
          subtitle: Text(widget.user.about,style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),
          //trailing: const Text("Time",style: TextStyle(color: Colors.white30,fontSize: 12),),
          trailing: Container(height: 12,width: 12,decoration: BoxDecoration(color: Colors.lightGreenAccent,borderRadius: BorderRadius.circular(10))),
        )
      ),
    );
  }
}
