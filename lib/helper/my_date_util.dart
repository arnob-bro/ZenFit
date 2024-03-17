import 'package:flutter/material.dart';

class MyDateUtil{
  String getFormattedTime({required BuildContext context,required String time}){
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return TimeOfDay.fromDateTime(date).format(context);
  }

  String getLastMessageTime({required BuildContext context,required String time, bool showYear =false}){
    final DateTime sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final DateTime now = DateTime.now();

    if(now.day == sent.day && now.month == sent.month && now.year == sent.year){
      return TimeOfDay.fromDateTime(sent).format(context);
    }

    return showYear ? '${sent.day} ${getMonth(sent)} ${sent.year}' : '${sent.day} ${getMonth(sent)}';
  }

  String getMessageTime({required BuildContext context,required String time}){
    final DateTime sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final DateTime now = DateTime.now();

    final formatterTime = TimeOfDay.fromDateTime(sent).format(context);
    if(now.day == sent.day && now.month  == sent.month && now.year == sent.year) {
      return formatterTime;
    }
    return now.year == sent.year
        ? '$formatterTime - ${sent.day} ${getMonth(sent)}'
        : '$formatterTime - ${sent.day} ${getMonth(sent)} ${sent.year}';

  }

  //get formatted last active time of user
  String getLastActiveTime({required BuildContext context,required String lastActive}){
    final int i = int.tryParse(lastActive) ?? -1;
    //if time is not available then return below statement
    if(i == -1) return 'Last seen not available';

    final DateTime time = DateTime.fromMillisecondsSinceEpoch(i);
    final DateTime now = DateTime.now();

    String formattedTime = TimeOfDay.fromDateTime(time).format(context);
    if(time.day == now.day && time.month == now.month && time.year == now.year){
      return 'Last seen today at $formattedTime';
    }

    String month = getMonth(time);
    return 'Last seen on ${time.day} $month on $formattedTime';

  }

  //get month name from month no. or index
  String getMonth(DateTime date){
    switch (date.month){
      case 1 :
        return 'Jan';
      case 2 :
        return 'Feb';
      case 3 :
        return 'Mar';
      case 4 :
        return 'Apr';
      case 5 :
        return 'May';
      case 6 :
        return 'Jun';
      case 7 :
        return 'Jul';
      case 8 :
        return 'Aug';
      case 9 :
        return 'Sep';
      case 10 :
        return 'Oct';
      case 11 :
        return 'Nov';
      case 12 :
        return 'Dec';
    }
    return 'NA';
  }

}