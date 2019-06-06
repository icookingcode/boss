import 'dart:convert';

import 'package:meta/meta.dart';

class Company {
  final String logo; //logo
  final String name; //名称
  final String location; //位置
  final String type; //类型
  final String size; //规模
  final String employee; //公司人数
  final String hot; //热招职位
  final String count; //职位总数
  final String inc; //公司详情

  Company(
      {this.logo,
      @required this.name,
      this.location,
      @required this.type,
      @required this.size,
      @required this.employee,
      this.hot,
      @required this.count,
      @required this.inc});

  static List<Company> fromJson(String json) {
    List<Company> _companys = [];
    JsonDecoder decoder = JsonDecoder();
    var mapData = decoder.convert(json)['list'];
    mapData.forEach((obj) {
      Company company = Company(
        name: obj['name'],
        logo: obj['logo'],
        size: obj['size'],
        location: obj['location'],
        type: obj['type'],
        employee: obj['employee'],
        hot: obj['hot'],
        count: obj['count'],
        inc: obj['inc'],
      );
      _companys.add(company);
    });
    return _companys;
  }
}
