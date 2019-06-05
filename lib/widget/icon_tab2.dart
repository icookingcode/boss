import 'package:flutter/material.dart';

class IconTab2 extends StatefulWidget {
  final String text;
  final String icon;
  final Color color;

  IconTab2({@required this.text, @required this.icon, @required this.color});

  @override
  _IconTab2State createState() => _IconTab2State();
}

class _IconTab2State extends State<IconTab2> {
  @override
  Widget build(BuildContext context) {
    Widget label = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Image(
            image: AssetImage(widget.icon),
            height: 30,
            width: 30,
          ),
          margin: EdgeInsets.only(bottom: 3),
        ),
        Text(
          widget.text,
          softWrap: false,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: widget.color,
            fontSize: 13
          ),
        ),
      ],
    );
    return SizedBox(
      height: 53,
      child: Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }
}
