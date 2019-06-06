import 'package:flutter/material.dart';
import '../model/job.dart';

class JobListItem extends StatelessWidget {
  final Job job;

  JobListItem({@required this.job});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 5, right: 5),
      child: SizedBox(
        child: Card(
          elevation: 0.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, bottom: 5),
                          child: Text(job.name),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  job.salary,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 5.0, left: 10.0, bottom: 5.0),
                      child: Text(
                        job.cname + ' ' + job.size,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.grey[400],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 5, right: 10),
                          child: Text(
                            job.username + " | " + job.title,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
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
