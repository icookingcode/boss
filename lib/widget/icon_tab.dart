import 'package:flutter/material.dart';

const defaultSelColor = Color.fromARGB(255, 0, 215, 198);

class IconTab extends StatefulWidget {
  final String title;
  final IconData iconData;
  final ImageProvider imageProvider;
  final double width;
  final Color selectedColor;

  bool isSel = false;

  IconTab({
    @required this.title,
    this.iconData,
    this.imageProvider,
    this.width = 60,
    this.isSel = false,
    this.selectedColor = defaultSelColor,
  });

  @override
  _IconTabState createState() => _IconTabState();
}

class _IconTabState extends State<IconTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 50,
      child: FlatButton(
        padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
        onPressed: null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getIcon(),
            Text(
              widget.title,
              style: TextStyle(
                color: widget.isSel ? widget.selectedColor : Colors.grey[900],
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getIcon() {
    if (widget.iconData != null) {
      return Icon(
        widget.iconData,
        color: widget.isSel ? widget.selectedColor : Colors.grey[900],
        size: 25.0,
      );
    } else if (widget.imageProvider != null) {
      return Image(
        image: widget.imageProvider,
        height: 25,
        width: 25,
      );
    } else {
      return Container();
    }
  }
}
