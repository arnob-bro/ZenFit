import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenfit/Model/message.dart';
import 'package:zenfit/Model/zenfit_user.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/helper/my_date_util.dart';

import '../UI/chat_screen.dart';
import '../main.dart';

class ChatUserCard extends StatefulWidget {

  final ZenFitUser user;

  const ChatUserCard({super .key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {

  //last message info (if null --> no message
  Message? _message;

  @override
  Widget build(BuildContext context) {

    mq = MediaQuery.of(context).size;

    return Card(
      color: Colors.black,
      child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (_) => ChatScreen(user: widget.user,)));
        },
        child: StreamBuilder(
            stream: DatabaseService.getLastMessage(widget.user),
            builder: (context, snapshot){
              final data = snapshot.data?.docs;
              final _list = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
              if(_list.isNotEmpty){
                _message = _list[0];
              }

              return ListTile(

                leading: (widget.user.image != 'null')
                    ?
                    ClipRRect(borderRadius: BorderRadius.circular(mq.height *.3),child: CachedNetworkImage(height: mq.height *.046, width: mq.height * .046,fit: BoxFit.cover, imageUrl: widget.user.image, /*placeholder: (context, url) => CircularProgressIndicator(),*/errorWidget: (context, url, error) => const CircleAvatar(child: Icon(CupertinoIcons.person))))
                    :
                    const CircleAvatar(child: Icon(CupertinoIcons.person,)),

                title: Text(widget.user.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,color: Colors.white
                  ),
                ),

                subtitle: Text(_message != null
                    ?
                    _message!.type == 'image'
                      ?
                       'image'
                      :
                        _message!.msg
                    :
                    "Say Hi! 👋",
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color:  (_message != null && _message!.read == '' && _message!.fromId != DatabaseService.user.uid) ? Colors.white : Colors.white38
                  ),
                ),

                //trailing: const Text("Time",style: TextStyle(color: Colors.white30,fontSize: 12),),
                trailing: _message == null
                    ?
                    null //show nothing when no message is sent
                    :
                    widget.user.isOnline
                        ?
                        Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                color: Colors.lightGreenAccent,
                                borderRadius: BorderRadius.circular(10),
                            )
                        )
                        :
                        Text(
                          MyDateUtil().getLastMessageTime(context: context, time: _message!.sent),
                          style: const TextStyle(
                              color: Colors.white30,fontSize: 12
                          ),
                        )
              );
            }
        )
      ),
    );
  }
}
