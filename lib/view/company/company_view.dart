import 'package:boss/item/companylist_item.dart';
import 'package:boss/model/company.dart';
import 'package:flutter/material.dart';

class CompanyTab extends StatefulWidget {
  @override
  _CompanyTabState createState() => _CompanyTabState();
}

class _CompanyTabState extends State<CompanyTab> {
  List<Company> _companys = [];

  @override
  void initState() {
    super.initState();
    getCompanyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('公司',style: TextStyle(color: Colors.white,),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: _companys.length,
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
      child: CompanyListItem(company: _companys[index],),
    );
  }

  void getCompanyList() {
    _companys = Company.fromJson(
        "{\"list\": [{\"name\": \"杭州蚂蚁金服信息技术有限公司\",\"logo\": \"http://m.qpic.cn/psb?/V14eDJ0U1Q9jx2/pbvagXSYO0s1LlvCwygDgmlU48S7Ov34CkOSGIuPDE8!/b/dMUAAAAAAAAA&bo=tAO0AwAAAAARBzA!&rf=viewer_4\",\"size\": \"B轮\",\"type\": \"互联网\",\"employee\": \"10000人以上\",\"hot\": \"资深产品技术工程师\",\"location\": \"上海市浦东新区\",\"count\":\"500\",\"inc\":\"蚂蚁金服是一家旨在为世界带来普惠金融服务的科技企业。蚂蚁金服起步于 2004 年成立的支付宝。2014 年 10 月，蚂蚁金服正式成立。蚂蚁金服以“为世界带来更多平等的机会”为使命，致力于通过科技创新能力，搭建一个开放、共享的信用体系和金融服务平台，为全球消费者和小微企业提供安全、便捷的普惠金融服务。\"}, {\"name\": \"百度\",\"logo\": \"http://m.qpic.cn/psb?/V14eDJ0U1Q9jx2/pbvagXSYO0s1LlvCwygDgmlU48S7Ov34CkOSGIuPDE8!/b/dMUAAAAAAAAA&bo=tAO0AwAAAAARBzA!&rf=viewer_4\",\"location\": \"上海市浦东新区\",\"size\": \"已上市\",\"type\": \"互联网\",\"employee\": \"10000人以上\",\"hot\": \"Android架构师\",\"count\":\"300\",\"inc\":\"百度在线网络技术（北京）有限公司，是中国最大互联网公司百度的全称。百度（Nasdaq简称：BIDU）是全球最大的中文搜索引擎，2000年1月由李彦宏、徐勇两人创立于北京中关村，致力于向人们提供“简单，可依赖”的信息获取方式。“百度”二字源于中国宋朝词人辛弃疾的《青玉案·元夕》词句“众里寻他千百度”，象征着百度对中文信息检索技术的执著追求。\"}]}");
  }
}
