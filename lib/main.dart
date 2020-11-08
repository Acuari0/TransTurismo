import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'selectlenguage.dart';



//run
void main() {


    runApp(new MyApp('TransTurismo'));


}
//order
class MyApp extends StatelessWidget {
  String title;
  MyApp(this.title);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SelectLenguage()/*TypeofService(true)*/,

    );
  }
}




