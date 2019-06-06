import 'package:boss/item/messagelist_item.dart';
import 'package:boss/model/message.dart';
import 'package:flutter/material.dart';
class MessageTab extends StatefulWidget {
  @override
  _MessageTabState createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  List<Message> _msgs = [];

  @override
  void initState() {
    super.initState();
    getMessageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: _msgs.length,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                '敬请期待...',
                style: TextStyle(fontSize: 20),
              ),
            ));
      },
      child: MessageListItem(
        msg: _msgs[index],
      ),
    );
  }

  void getMessageList() {
    _msgs = Message.fromJson(
        "{\"list\": [{\"name\": \"架构师（Android）\",\"avatar\": \"http://m.qpic.cn/psb?/V14eDJ0U1Q9jx2/pbvagXSYO0s1LlvCwygDgmlU48S7Ov34CkOSGIuPDE8!/b/dMUAAAAAAAAA&bo=tAO0AwAAAAARBzA!&rf=viewer_4\",\"company\": \"百度\",\"position\": \"HR\",\"msg\": \"Hi~\"}]}");
  }
}