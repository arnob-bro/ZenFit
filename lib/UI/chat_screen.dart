import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zenfit/Model/zenfit_user.dart';
import 'package:zenfit/Service/Database.dart';
import 'package:zenfit/UI/other_users_profile.dart';
import 'package:zenfit/Widgets/message_card.dart';
import 'package:zenfit/helper/my_date_util.dart';

import '../Model/message.dart';
import '../main.dart';

class ChatScreen extends StatefulWidget {

  final ZenFitUser user;
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  List<Message> _list = [] ;
  final _textController = TextEditingController();
  bool _showEmoji = false, _isUploading = false;
  final controller = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: WillPopScope(
          onWillPop: (){
            if(_showEmoji){
              setState(() {
                _showEmoji = !_showEmoji;
              });
              return Future.value(false);
            }else{
              return Future.value(true);
            }
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              flexibleSpace: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UsersProfile(user: widget.user)));
                },
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

                          Text(
                            widget.user.isOnline==true ? 'Online' : MyDateUtil().getLastActiveTime(context: context, lastActive: widget.user.lastActive),
                            style: const TextStyle(
                              fontSize: 13,
                              //fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  )

              ),
            ),
                
            body: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                      stream: DatabaseService.getAllmessages(widget.user),
                      builder: (context, snapshot){

                  
                        switch(snapshot.connectionState){
                        //if data is loading
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return const SizedBox();
                  
                        //if data is loaded
                          case ConnectionState.active:
                          case ConnectionState.done:
                            final data = snapshot.data?.docs;
                
                            _list = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
                
                            if(_list.isNotEmpty){
                              return ListView.builder(
                                  reverse: true,
                                  itemCount: _list.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context,index){
                                    return MessageCard(message: _list[index],textEditingController: _textController,);
                                  }

                              );
                            }
                            else{
                              return const Center(child: Text("Say Hi! 👋",style: TextStyle(color: Colors.white,fontSize: 20),));
                            }
                        }
                      }
                  ),
                ),

                //progress indicator for showing uploading
                if(_isUploading)
                   const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: CircularProgressIndicator(),
                      )
                  ),

                //chat input widget
                _chatInput(),
                
                if(_showEmoji)
                SizedBox(
                  height: mq.height * .35,
                  child: EmojiPicker(
                    textEditingController: _textController,
                    config: Config(
                      bgColor: Colors.black,
                      columns: 7,
                      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                    ),
                  ),
                )
              ],
            ),
          ),
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
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        setState(() {
                          _showEmoji = !_showEmoji;
                        });
                      },
                      icon: const Icon(Icons.emoji_emotions,color: Color.fromRGBO(0, 148, 210, 8),)
                  ),
                  Expanded(
                      child: TextField(

                        controller: _textController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onTap: (){
                          if(_showEmoji) setState(() {
                            _showEmoji = !_showEmoji;
                          });
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Type something...',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      )
                  ),
                  IconButton(
                      onPressed: ()async{
                        final ImagePicker picker = ImagePicker();
                        //pick an image
                        final List<XFile> images = await picker.pickMultiImage(imageQuality: 70);
                        for(var image in images){
                          print('Image path : ${image.path}');
                          setState(() {_isUploading =true;});
                          await DatabaseService.sendChatImage(widget.user, File(image.path));
                          setState(() {_isUploading =false;});
                        }
                      },
                      icon: const Icon(Icons.image,color: Color.fromRGBO(0, 148, 210, 8),)
                  ),
                  IconButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        //pick an image
                        final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 70);
                        if(image!= null){
                          print('Image path : ${image.path}');

                          await DatabaseService.sendChatImage(widget.user, File(image.path));
                        }
                      },
                      icon: const Icon(Icons.camera_alt_rounded,color: Color.fromRGBO(0, 148, 210, 8),)
                  ),
                  SizedBox(width: mq.width * .02,)
                ],
              ),
          ),
        ),

        MaterialButton(
          minWidth: 0,
          padding: const EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 10),
          shape: const CircleBorder(),
          onPressed: (){
            if(_textController.text.isNotEmpty){
              DatabaseService.sendMessage(widget.user, _textController.text.trim(),'text');
              _textController.text = '';
            }
          },
          color: Colors.lightGreen,
          child: const Icon(Icons.send,color: Colors.white,),
        )
      ],

    );

  }

}
