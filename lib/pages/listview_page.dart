import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bean/mixed_bean.dart';
import '../utils/Common.dart';

class ListViewPage extends StatelessWidget {
  ListViewPage({super.key});

  List<Car> dataList = const [
    Car(
      name: '保时捷918 Spyder',
      imageUrl:
          'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
    ),
    Car(
      name: '兰博基尼Aventador',
      imageUrl:
          'https://upload-images.jianshu.io/upload_images/2990730-e3bfd824f30afaac?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
    ),
    Car(
      name: '法拉利Enzo',
      imageUrl:
          'https://upload-images.jianshu.io/upload_images/2990730-a1d64cf5da2d9d99?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
    ),
    Car(
      name: 'Zenvo ST1',
      imageUrl:
          'https://upload-images.jianshu.io/upload_images/2990730-bf883b46690f93ce?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
    ),
    Car(
      name: '迈凯伦F1',
      imageUrl:
          'https://upload-images.jianshu.io/upload_images/2990730-5a7b5550a19b8342?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
    ),
    Car(
      name: '萨林S7',
      imageUrl:
          'https://upload-images.jianshu.io/upload_images/2990730-2e128d18144ad5b8?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
    ),
    Car(
      name: '科尼赛克CCR',
      imageUrl:
          'https://upload-images.jianshu.io/upload_images/2990730-01ced8f6f95219ec?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
    ),
    Car(
      name: '布加迪Chiron',
      imageUrl:
          'https://upload-images.jianshu.io/upload_images/2990730-7fc8359eb61adac0?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
    ),
    Car(
      name: '轩尼诗Venom GT',
      imageUrl:
          'https://upload-images.jianshu.io/upload_images/2990730-d332bf510d61bbc2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
    ),
    Car(
      name: '西贝尔Tuatara',
      imageUrl:
          'https://upload-images.jianshu.io/upload_images/2990730-3dd9a70b25ae6bc9?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      appBar: Common.appBar(context, "ListView Sample"),
      body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return _itemWidget(dataList[index]);
          }),
    );
  }

  Widget _itemWidget(Car carInfo) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: const [BoxShadow(color: Color.fromARGB(10, 0, 0, 0), offset: Offset(3,3))]
        ),
        child: Column(
          children: [
            Image.network(carInfo.imageUrl),
            const SizedBox(height: 10),
            Text(carInfo.name)
          ],
        ),
      ),
    );
  }
}
