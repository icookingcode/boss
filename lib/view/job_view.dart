import 'package:boss/item/joblist_item.dart';
import 'package:boss/model/job.dart';
import 'package:flutter/material.dart';
class JobView extends StatefulWidget {
  @override
  _JobViewState createState() => _JobViewState();
}

class _JobViewState extends State<JobView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android'),
      ),
      body: ListView.builder(itemBuilder: _buildItem,itemCount: 10,),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    Job job = Job(title: 'php技术总监',cname: '公司规模',size: '200人',salary: '20-40K',username: '',name: 'php技术总监');
    return JobListItem(job: job,);
  }
}
