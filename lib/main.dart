import 'package:indomart/core.dart';
import 'package:flutter/material.dart';
import 'package:indomart/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false, 
      title: 'Indomerce ',
navigatorKey: Get.navigatorKey,
      home:  HomePage(),
    );
  }
}
