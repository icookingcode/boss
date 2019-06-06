import 'package:boss/model/message.dart';
import 'package:flutter/material.dart';

class MessageListItem extends StatelessWidget {
  final Message msg;

  MessageListItem({@required this.msg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      child: SizedBox(
        child: Card(
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(msg.avatar),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      msg.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      msg.company + " | " + msg.position,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 13,color: Colors.grey),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      msg.msg ,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12,color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
