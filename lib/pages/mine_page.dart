import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('text'),
                  titlePadding: EdgeInsets.all(10),
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  //background: Image.asset(Constant.ASSETS_IMG + 'bg_person_center_default.webp'),
                  background: Image(
                    image: NetworkImage(
                        'https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(5),
              ),
              // SliverToBoxAdapter(
              //   child: Container(
              //     height: 100,
              //     child: Center(
              //       child: Text("22222"),
              //     ),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "我的关注",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              // _MineItem("imgAsset", "title"),
              SliverToBoxAdapter(
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "我的关注2",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _MineItem(String imgAsset, String title,
      {VoidCallback? onTab}) {
    return const SliverToBoxAdapter(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "我的关注",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
        )
    );
  }

  SliverToBoxAdapter _divider() {
    return SliverToBoxAdapter(
      child: Container(
        height: 10.0,
        color: const Color.fromARGB(255, 247, 247, 247),
      ),
    );
  }
}
