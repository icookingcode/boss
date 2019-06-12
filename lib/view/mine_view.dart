import 'package:flutter/material.dart';

class MineTab extends StatelessWidget {
  final double _appBarHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  DecoratedBox(
                    //修饰
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 0.4),
                        colors: [Color(0x00000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 30.0, right: 20.0),
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundImage: NetworkImage(
                              'http://m.qpic.cn/psb?/V14eDJ0U1Q9jx2/pbvagXSYO0s1LlvCwygDgmlU48S7Ov34CkOSGIuPDE8!/b/dMUAAAAAAAAA&bo=tAO0AwAAAAARBzA!&rf=viewer_4'),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10,
                                ),
                                child: Text(
                                  '哆唻A梦',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              Text('在职-考虑机会',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ContractItem(
                          title: '沟通过',
                          count: '10',
                          onPressed: (){
                            showDialog(context: context, builder:(context)=> AlertDialog(content: Text("沟通过",style: TextStyle(fontSize: 20),),),);
                          },
                        ),
                        ContractItem(
                          title: '未沟通',
                          count: '20',
                          onPressed: (){
                            showDialog(context: context, builder:(context)=> AlertDialog(content: Text("未沟通",style: TextStyle(fontSize: 20),),),);
                          },
                        ),
                        ContractItem(
                          title: '已拒绝',
                          count: '5',
                          onPressed: (){
                            showDialog(context: context, builder:(context)=> AlertDialog(content: Text("已拒绝",style: TextStyle(fontSize: 20),),),);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContractItem extends StatelessWidget {
  final String title;
  final String count;
  final VoidCallback onPressed;

  ContractItem({this.title, this.count, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Text(
            count,
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Text(title),
        ],
      ),
    );
  }
}
