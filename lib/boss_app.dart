import 'package:boss/view/company/company_view.dart';
import 'package:boss/view/jobs_view.dart';
import 'package:boss/view/message_view.dart';
import 'package:boss/widget/icon_tab.dart';
import 'package:boss/widget/icon_tab2.dart';
import 'package:flutter/material.dart';

class BossApp extends StatefulWidget {
  @override
  _BossAppState createState() => _BossAppState();
}

const int INDEX_JOB = 0;
const int INDEX_COMPANY = 1;
const int INDEX_MSG = 2;
const int INDEX_MY = 3;
const defaultSelColor = Color.fromARGB(255, 0, 215, 198);

class _BossAppState extends State<BossApp> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(initialIndex: _currentIndex, length: 4, vsync: this);
    onChanged = () {
      setState(() {
        _currentIndex = _controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          JobTab(),
          CompanyTab(),
          MessageTab(),
          Text('4'),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(fontSize: 13),
          controller: _controller,
//          tabs: _getTabBarView2(),
          tabs: _getTabBarView(),
        ),
      ),
    );
  }

  List<Widget> _getTabBarView() {
    return [
      IconTab(
        imageProvider: _currentIndex == INDEX_JOB
            ? AssetImage('assets/images/ic_main_tab_find_pre.png')
            : AssetImage('assets/images/ic_main_tab_find_nor.png'),
        title: "职位",
        isSel: _currentIndex == INDEX_JOB,
      ),
      IconTab(
        imageProvider: _currentIndex == INDEX_COMPANY
            ? AssetImage('assets/images/ic_main_tab_company_pre.png')
            : AssetImage('assets/images/ic_main_tab_company_nor.png'),
        title: "公司",
        isSel: _currentIndex == INDEX_COMPANY,
      ),
      IconTab(
        imageProvider: _currentIndex == INDEX_MSG
            ? AssetImage('assets/images/ic_main_tab_contacts_pre.png')
            : AssetImage('assets/images/ic_main_tab_contacts_nor.png'),
        title: "消息",
        isSel: _currentIndex == INDEX_MSG,
      ),
      IconTab(
        imageProvider: _currentIndex == INDEX_MY
            ? AssetImage('assets/images/ic_main_tab_my_pre.png')
            : AssetImage('assets/images/ic_main_tab_my_nor.png'),
        title: "我的",
        isSel: _currentIndex == INDEX_MY,
      ),
    ];
  }

  List<Widget> _getTabBarView2() {
    return [
      IconTab2(
        text: '职位',
        icon: _currentIndex == INDEX_JOB
            ? 'assets/images/ic_main_tab_find_pre.png'
            : 'assets/images/ic_main_tab_find_nor.png',
        color: _currentIndex == INDEX_JOB ? defaultSelColor : Colors.grey[900],
      ),
      IconTab2(
        text: '公司',
        icon: _currentIndex == INDEX_COMPANY
            ? 'assets/images/ic_main_tab_company_pre.png'
            : 'assets/images/ic_main_tab_company_nor.png',
        color:
            _currentIndex == INDEX_COMPANY ? defaultSelColor : Colors.grey[900],
      ),
      IconTab2(
        text: '消息',
        icon: _currentIndex == INDEX_MSG
            ? 'assets/images/ic_main_tab_contacts_pre.png'
            : 'assets/images/ic_main_tab_contacts_nor.png',
        color: _currentIndex == INDEX_MSG ? defaultSelColor : Colors.grey[900],
      ),
      IconTab2(
        text: '我的',
        icon: _currentIndex == INDEX_MY
            ? 'assets/images/ic_main_tab_my_pre.png'
            : 'assets/images/ic_main_tab_my_nor.png',
        color: _currentIndex == INDEX_MY ? defaultSelColor : Colors.grey[900],
      ),
    ];
  }
}
