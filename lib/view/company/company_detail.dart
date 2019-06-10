import 'package:boss/model/company.dart';
import 'package:flutter/material.dart';
import 'company_hot_job.dart';
import 'company_inc.dart';
import 'company_info.dart';
import '../../widget/indicator_viewpager.dart';

const double _kAppBarHeight = 168.0;

class CompanyDetail extends StatefulWidget {
  final Company company;

  CompanyDetail({@required this.company});

  @override
  _CompanyDetailState createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail>
    with SingleTickerProviderStateMixin {
  List<Widget> _imagePages;
  List<String> _urls = [
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559815456078&di=2a685454ec2f3f6763352a4da72e69fc&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F54%2F93%2F16pic_5493004_b.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559815472451&di=cafb2355ac34712cf23dcc759ce95fba&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fa3e592c653ea46adfe1809e35cd7bc58508a6cb94307-aaO54C_fw658',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559815491264&di=e436b0d7da236ad2bb61e57a21e49913&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F3b48fa78946e44a72262777268f6c638ef24830920e4d-yBuKnn_fw658'
  ];

  List<Tab> _tabs;
  TabController _controller;
  Widget _companyTabContent;
  VoidCallback onChanged;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    if (_urls.isNotEmpty) {
      _imagePages = <Widget>[];
      _urls.forEach((url) {
        _imagePages.add(Container(
          color: Colors.black.withAlpha(200),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image(
              image: NetworkImage(url),
              fit: BoxFit.cover,
              height: _kAppBarHeight,
            ),
          ),
        ));
      });
    }
    _tabs = [
      Tab(
        text: '公司概况',
      ),
      Tab(
        text: '热招职位',
      ),
    ];
    _companyTabContent = CompanyInc(
      inc: widget.company.inc,
    );
    _controller = TabController(length: _tabs.length, vsync: this);
    onChanged = () {
      setState(() {
        _currentIndex = _controller.index;
        if (_currentIndex == 0) {
          _companyTabContent = CompanyInc(
            inc: widget.company.inc,
          );
        } else {
          _companyTabContent = CompanyHotJob();
        }
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '公司详情',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox.fromSize(
              size: Size.fromHeight(_kAppBarHeight),
              child: IndicatorViewPager(_imagePages),
            ),
            CompanyInfo(company: widget.company),
            Divider(
              height: 2,
            ),
            TabBar(
              tabs: _tabs,
              controller: _controller,
            ),
            _companyTabContent,
          ],
        ),
      ),
    );
  }
}
