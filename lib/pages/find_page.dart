import 'package:demo_flutter_app2/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FindPageState();
  }
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, //导航栏透明
            statusBarIconBrightness: Brightness.light),
        elevation: 2,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        centerTitle: true,
        title: const Text(
          "Find",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: const Color.fromARGB(22, 56, 23, 77),
            padding: const EdgeInsets.all(12.0),
            child: const Text("Item1"),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("Item2"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("More"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      persistentFooterButtons: _persistentFooterButtons(),
    );
  }

  List<Widget> _persistentFooterButtons() {
    return [
      radiusContainer(Colors.red),
      radiusContainer(Colors.green),
      radiusContainer(Colors.cyan),
    ];
  }

  Container radiusContainer(Color bgColor) {
    double width = ScreenUtils.screenW() / 3.3;
    return Container(
      width: width,
      height: 60,
      //color: bgColor,
      decoration: BoxDecoration(
        border: Border.all(color: bgColor, width: 1),
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'http://tiebapic.baidu.com/forum/w%3D580/sign=a96ca741eafaaf5184e381b7bc5594ed/7ea6a61ea8d3fd1f2643ad5d274e251f95ca5f38.jpg'),
          // centerSlice: Rect.largest,
        ),
      ),
    );
  }
}
