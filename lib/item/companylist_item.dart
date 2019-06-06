import 'package:boss/model/company.dart';
import 'package:flutter/material.dart';

class CompanyListItem extends StatelessWidget {
  final Company company;

  CompanyListItem({@required this.company});

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
                  backgroundImage: NetworkImage(company.logo),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "热招：" + company.hot + " | " + company.count,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          ImageIcon(
                            AssetImage('assets/images/f3_right_arrow_grey.png'),
                            size: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
