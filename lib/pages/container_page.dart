import 'package:demo_flutter_app2/pages/find_page.dart';
import 'package:demo_flutter_app2/pages/market_page.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';
import 'home_page.dart';
import 'mine_page.dart';

///这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

class _ContainerPageState extends State<ContainerPage> {
  // final ShopPageWidget shopPageWidget  = ShopPageWidget();
  List<Widget>? pages;

  final defaultItemColor = const Color.fromARGB(255, 125, 125, 125);

  final itemNames = [
    _Item('首页', '${Constant.ASSETS_IMG}ic_tab_home_active.png',
        '${Constant.ASSETS_IMG}ic_tab_home_normal.png'),
    _Item('书影音', '${Constant.ASSETS_IMG}ic_tab_subject_active.png',
        '${Constant.ASSETS_IMG}ic_tab_subject_normal.png'),
    _Item('小组', '${Constant.ASSETS_IMG}ic_tab_group_active.png',
        '${Constant.ASSETS_IMG}ic_tab_group_normal.png'),
    _Item('市集', '${Constant.ASSETS_IMG}ic_tab_shiji_active.png',
        '${Constant.ASSETS_IMG}ic_tab_shiji_normal.png'),
    _Item('我的', '${Constant.ASSETS_IMG}ic_tab_profile_active.png',
        '${Constant.ASSETS_IMG}ic_tab_profile_normal.png')
  ];

  List<BottomNavigationBarItem>? itemList;

  @override
  void initState() {
    super.initState();
    print('initState _ContainerPageState');
    if (pages == null) {
      pages = [HomePage(), FindPage(), HomePage(), MarketPage(), MinePage()];
    }
    if (itemList == null) {
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
              icon: Image.asset(
                item.normalIcon,
                width: 30.0,
                height: 30.0,
              ),
              label: item.name,
              activeIcon:
                  Image.asset(item.activeIcon, width: 30.0, height: 30.0)))
          .toList();
    }
  }

  int _selectIndex = 0;

//Stack（层叠布局）+Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages![index],
      ),
    );
  }

  @override
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    print('build _ContainerPageState---$_selectIndex');
    return Scaffold(
      body: Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
          _getPagesWidget(4),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList!,
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          setState(() {
            _selectIndex = index;
            //这个是用来控制比较特别的shopPage中WebView不能动态隐藏的问题
            //shopPageWidget.setShowState(pages.indexOf(shopPageWidget) == _selectIndex);
          });
        },
        //图标大小
        iconSize: 24,
        //当前选中的索引
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: const Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
