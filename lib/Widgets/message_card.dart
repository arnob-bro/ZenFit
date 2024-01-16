import 'package:flutter/material.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/helper/my_date_util.dart';

import '../Model/message.dart';
import '../main.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key, required this.message});

  final Message message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return DatabaseService().user.uid == widget.message.fromId ? _purpleMessage() : _greyMessage();
  }

  Widget _greyMessage(){
    //update last read message if sender and receiver are different
    if(widget.message.read.isEmpty){
      DatabaseService().updateMessageReadStatus(widget.message);
      print('message read has been updated');
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(mq.width * .04),
            margin: EdgeInsets.symmetric(
              horizontal: mq.width * .04, vertical: mq.height * .01
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 133, 133, 133),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
            ),
            child: Text(widget.message.msg,style: const TextStyle(color: Colors.white,fontSize: 15),),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: mq.width * .04),
          child: Text(
            MyDateUtil().getFormattedTime(context: context, time: widget.message.sent),
            style: const TextStyle(fontSize: 13,color: Colors.white54),
          ),
        )
      ],
    );
  }

  Widget _purpleMessage(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: mq.width * .04,),
            if(widget.message.read.isNotEmpty) const Icon(Icons.done_all_rounded, color: Colors.blue,size: 20,),
            const SizedBox(width: 2,),
            Text(
              MyDateUtil().getFormattedTime(context: context, time: widget.message.sent),
              style: const TextStyle(fontSize: 13,color: Colors.white54),
            ),
          ],
        ),

        Flexible(
          child: Container(
            padding: EdgeInsets.all(mq.width * .04),
            margin: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .01
            ),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 163, 52, 250),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )
            ),
            child: Text(widget.message.msg,style: const TextStyle(color: Colors.white,fontSize: 15),),
          ),
        ),

      ],
    );
  }
}
