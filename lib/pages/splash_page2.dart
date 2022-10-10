import 'package:demo_flutter_app2/constant/constant.dart';
import 'package:demo_flutter_app2/widgets/SkipDownTimeProgress.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

class SplashPage2 extends StatefulWidget {
  const SplashPage2({super.key});

  @override
  State<SplashPage2> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage2> {
  String netImgUrl = '';

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(microseconds: 800), () {
      netImgUrl =
          'https://img2.baidu.com/it/u=1170834292,3580907519&fm=253&fmt=auto&app=138&f=JPG?w=500&h=889';

      if (netImgUrl.isNotEmpty) {
        setState(() {}); //刷新页面使广告图显示
      } else {
        //无广告页
        Future.delayed(const Duration(microseconds: 10), toHome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: netImgUrl.isNotEmpty
              ? Image.network(
                  netImgUrl,
                  fit: BoxFit.fill,
                )
              : Image.asset("assets/images/sofa.png", fit: BoxFit.fill), //未请求回来之前，用启动页图片作为占位图
        ),
        Visibility(
            visible: netImgUrl.isNotEmpty,
            child: Positioned(
              top: MediaQueryData.fromWindow(ui.window).padding.top + 20,
              right: 30,
              child: SkipDownTimeProgress(
                color: Colors.red,
                radius: 22,
                duration: const Duration(seconds: 5),
                size: const Size(25, 25),
                skipText: "跳过",
                onTap: () => toHome(),
                onFinishCallBack: (bool value) {
                  if (value) toHome();
                },
              ),
            ))
      ],
    );
  }

  void toHome() {
    Navigator.of(context).pushReplacementNamed("/index");
  }

  @override
  void dispose() {
    super.dispose();
  }
}
