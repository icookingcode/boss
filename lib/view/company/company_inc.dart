import 'package:flutter/material.dart';

class CompanyInc extends StatelessWidget {
  final String inc;

  CompanyInc({@required this.inc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(15),
          child:  Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text('公司介绍',style: TextStyle(fontSize: 15),),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                    text: inc,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
