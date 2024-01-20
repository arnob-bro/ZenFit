import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
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

  void _showBottomSheet(bool isMe){
    showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
          )
      ),
      builder: (_){
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10,bottom: 15),
          children: [
            Container(
              height: 4,
              margin: EdgeInsets.symmetric(horizontal: mq.width * .4),
              decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(8),
              ),
            ),

            widget.message.type == 'text'
            ?
            InkWell(
              onTap: ()async{
                await Clipboard.setData(ClipboardData(text: widget.message.msg)).then((value) {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text("Text Copied")
                      )
                  );
                });
              },
              child: Padding(
                padding: EdgeInsets.only(
                  left: mq.width * .05,
                  top: mq.height * .02,
                  bottom: mq.height * .02
                ),
                child: const Row(children: [ Icon(Icons.copy_all_rounded,color: Colors.blue,size: 26,),Flexible(child: Text('    Copy Text',style: TextStyle(fontSize: 15,color: Colors.black54,letterSpacing: 0.5),))],),
              ),
            )
            :
            InkWell(
              onTap: (){
                try{
                  GallerySaver.saveImage(widget.message.msg).then((success) {
                    Navigator.pop(context);
                    if(success != null && success){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text("Image Successfully saved")
                          )
                      );
                    }
                  });
                }catch(e){
                  print("ErrorWhileSavingImg: $e");
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: mq.width * .05,
                    top: mq.height * .02,
                    bottom: mq.height * .02
                ),
                child: const Row(children: [ const Icon(Icons.download_rounded,color: Colors.blue,size: 26,),Flexible(child: Text('    Save Image',style: TextStyle(fontSize: 15,color: Colors.black54,letterSpacing: 0.5),))],),
              ),
            ),

            if(isMe)
              InkWell(
                onTap: (){
                  DatabaseService.deleteMessage(widget.message).then((value) {
                    Navigator.pop(context);
                    print("text has been deleted");
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: mq.width * .05,
                      top: mq.height * .02,
                      bottom: mq.height * .02
                  ),
                  child: const Row(children: [ Icon(Icons.delete_forever,color: Colors.red,size: 26,),Flexible(child: Text('    Delete Message',style: TextStyle(fontSize: 15,color: Colors.red,letterSpacing: 0.5),))],),
                ),
              ),


            Divider(
              color: Colors.black54,
              endIndent: mq.width * .04,
              indent: mq.width* .04,
            ),

            InkWell(
              child: Padding(
                padding: EdgeInsets.only(
                    left: mq.width * .05,
                    top: mq.height * .02,
                    bottom: mq.height * .02
                ),
                child: Row(children: [ const Icon(Icons.remove_red_eye,color: Colors.blue,),Flexible(child: Text('    Sent At ${MyDateUtil().getMessageTime(context: context, time: widget.message.sent)}',style: const TextStyle(fontSize: 15,color: Colors.black54,letterSpacing: 0.5),))],),
              ),
            ),

            InkWell(
              child: Padding(
                padding: EdgeInsets.only(
                    left: mq.width * .05,
                    top: mq.height * .02,
                    bottom: mq.height * .02
                ),
                child: Row(
                  children: [
                    const Icon(Icons.remove_red_eye,color: Colors.green,),
                    Flexible(
                        child: Text(
                          widget.message.read.isNotEmpty ? '    Read At ${MyDateUtil().getMessageTime(context: context, time: widget.message.sent)}' : 'Not Seen Yet',
                          style: const TextStyle(
                            fontSize: 15,color: Colors.black54,letterSpacing: 0.5),
                        )
                    )
                  ],
                ),
              ),
            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    bool isMe = DatabaseService.user.uid == widget.message.fromId;
    return InkWell(
      onLongPress: (){
        _showBottomSheet(isMe);
      },
        child: isMe? _purpleMessage() : _greyMessage());
  }

  Widget _greyMessage(){
    //update last read message if sender and receiver are different
    if(widget.message.read.isEmpty){
      DatabaseService.updateMessageReadStatus(widget.message);
      print('message read has been updated');
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(widget.message.type == 'text' ? mq.width * .04 : mq.width * .00),
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
            child:
            widget.message.type == 'text' ?
            Text(widget.message.msg,style: const TextStyle(color: Colors.white,fontSize: 15),)
            :
             ClipRRect(
               borderRadius: BorderRadius.circular(mq.height * .015),
               child: CachedNetworkImage(
                 placeholder: (context,url) => const Padding(
                   padding: EdgeInsets.all(8.0),
                   child: CircularProgressIndicator(strokeWidth: 2,),
                 ),
                 imageUrl: widget.message.msg,
                 errorWidget: (context,url,error) => const Icon(Icons.image, size: 70,),
               ),
             ),
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
            padding: EdgeInsets.all(widget.message.type == 'text' ? mq.width * .04 : mq.width * .00),
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
            child:
            widget.message.type == 'text' ?
            Text(widget.message.msg,style: const TextStyle(color: Colors.white,fontSize: 15),)
                :
            ClipRRect(
              borderRadius: BorderRadius.circular(mq.height * .015),
              child: CachedNetworkImage(
                placeholder: (context,url) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(strokeWidth: 2,),
                ),
                imageUrl: widget.message.msg,
                errorWidget: (context,url,error) => const Icon(Icons.image, size: 70,),
              ),
            ),
          ),
        ),

      ],
    );
  }


}

