import 'package:flutter/material.dart';

class CompanyHotJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: '敬请期待',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              )
            ),
          ),
        ],
      ),
    );
  }
}
