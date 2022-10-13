
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

   static AppBar appBar(BuildContext context, String title){
     var appBar = AppBar(
       backgroundColor: Colors.white,
       elevation: 2,
       leading: IconButton(
           onPressed: () {
             Navigator.of(context).pop();
           },
           icon: const Icon(
             Icons.arrow_back_ios_rounded,
             color: Colors.black,
           )),
       centerTitle: true,
       title: Text(
         title,
         style: const TextStyle(color: Colors.black, fontSize: 20),
       ),
     );

     return appBar;
   }
}