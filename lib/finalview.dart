import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

class FinalView extends StatelessWidget{
  final bool language;
  FinalView(this.language);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(language ? 'images/final/finalen.png':'images/final/finalesp.png'),
            FlatButton(
              child: Text(language ? 'Go Back' : 'Regresar'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.grey)
              ),
              onPressed: (){
                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              }
            ),
          ],
        ),
      )
    );
  }
}