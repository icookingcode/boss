import 'package:boss/model/company.dart';
import 'package:flutter/material.dart';
class CompanyInfo extends StatelessWidget {
  final Company company;
  CompanyInfo({@required this.company});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child:SizedBox(
        child: Card(
          elevation: 0.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10,left: 15.0,right: 15.0,bottom: 0),
                child: Image.network(company.logo,width: 50,height: 50,),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      company.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      company.location,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      company.type +
                          " | " +
                          company.size +
                          " | " +
                          company.employee,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 11, color: Colors.grey),
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
