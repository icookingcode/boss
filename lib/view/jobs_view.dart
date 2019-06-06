import 'package:boss/item/joblist_item.dart';
import 'package:boss/model/job.dart';
import 'package:flutter/material.dart';

class JobTab extends StatefulWidget {
  @override
  _JobTabState createState() => _JobTabState();
}

class _JobTabState extends State<JobTab> {
  List<Job> _jobs = [];

  @override
  void initState() {
    super.initState();
    getJobList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android'),
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: _jobs.length,
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
      child: JobListItem(
        job: _jobs[index],
      ),
    );
  }

  void getJobList() {
    _jobs = Job.fromJson(
        "{\"list\": [{\"name\": \"架构师（Android）\",\"cname\": \"蚂蚁金服\",\"size\": \"B轮\",\"salary\": \"25k-45k\",\"username\": \"Claire\",\"title\": \"HR\"}, {\"name\": \"资深android架构师\",\"cname\": \"今日头条\",\"size\": \"D轮\",\"salary\": \"40k-60k\",\"username\": \"Kimi\",\"title\": \"HR\"}]}");
  }
}
