
import 'package:flutter/material.dart';

class Common{
   static AppBar commonAppBar(String title){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}