import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/Screen/HomePage.dart';
import 'package:spotify/Screen/RootScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
       
        home: RootScrren(),
      
    );
  }
}
