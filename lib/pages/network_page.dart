import 'package:demo_flutter_app2/utils/Common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      appBar: Common.appBar(context, "Network Sample"),
      body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (context, index) {
            return _itemWidget(index);
          }),
    );
  }

  Widget _itemWidget(int index) {
    var data = widgets[index];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("${data["id"]}. ${data["title"]}"),
    );
  }

  Future<void> loadData() async {
    var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}