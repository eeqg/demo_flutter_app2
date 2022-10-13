import 'package:demo_flutter_app2/pages/listview_page.dart';
import 'package:demo_flutter_app2/utils/Common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<StatefulWidget> createState() => _MarketState();
}

class _MarketState extends State<MarketPage> {
  var dataList = [];

  @override
  void initState() {
    super.initState();

    dataList.add({"title": "title1", "subtitle": "subTitle"});
    dataList.add({"title": "title2", "subtitle": "subTitlesubTitlesubTitlesubTitlesubTitlesubTitlesubTitlebTitlesububTitleesubTitleitlesubTitlesubbTitlesubTitlesub"});
    dataList.add({"title": "title3", "subtitle": ""});
    dataList.add({"title": "ListView", "subtitle": "ListView + container + car"});
    dataList.add({"title": "动画", "subtitle": "Animations"});
    dataList.add({"title": "title6", "subtitle": "subTitle"});
    dataList.add({"title": "title6", "subtitle": "subTitle"});
    dataList.add({"title": "异步加网络载数据", "subtitle": "异步加载数据并将之展示在 ListView 内"});
    dataList.add({"title": "title6", "subtitle": "subTitle"});
    dataList.add({"title": "title6", "subtitle": "subTitle"});
    dataList.add({"title": "title7", "subtitle": "subTitle"});
    dataList.add({"title": "title8", "subtitle": "subTitle"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.commonAppBar("市集"),
      body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
                height: 1,
                //thickness: 1,
                color: Color.fromARGB(50, 80, 80, 80),
              ),
          padding: const EdgeInsets.only(left: 12, right: 12),
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            var dataInfo = dataList[index];
            return ListTile(
              title: Text("${dataInfo["title"]}",
                  style: const TextStyle(fontSize: 20, color: Colors.black)),
              subtitle: Text("${dataInfo["subtitle"]}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
              onTap: () { _navigatePage(index); },
            );
          }),
    );
  }

  void _navigatePage(int index){
    var page;
    switch(index){
      case 3: page = ListViewPage();
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
