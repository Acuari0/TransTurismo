import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'typeofservice.dart';

class SelectLenguage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:<Widget> [Sequences(),
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [Image.asset('images/selectle/logo.png',
                width: 330,
                height: 155,),
                  SizedBox(height: 60,),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height:65,
                    minWidth: 247,
                    color: Color(0xff561848),
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    child: Text('English',style: TextStyle(fontSize: 20.0),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TypeofService(true)),
                      );
                    },
                  ),
                  SizedBox(height: 10,),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                    ),
                    height:65,
                    minWidth: 247,
                    color: Color(0xff561848),
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    child: Text('Español',style: TextStyle(fontSize: 20.0),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TypeofService(false)),
                      );
                    },
                  ),
                ],
              )
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
// Sequency
class Sequences extends StatefulWidget{
  Sequences({Key key}) : super (key : key);
  Sequences_State createState() => Sequences_State();
}
//States Sequency
class Sequences_State extends State<Sequences> with TickerProviderStateMixin{

  int s_photos=0;
  var path = {'images/selectle/fondo.png','images/logo100.png', 'images/logo_lo.png'};
  Timer timer, timer2;
  bool _visible= true;

  String ImageSelector(){
    return path.elementAt(s_photos);
  }

  @override
  void initState(){
    super.initState();
    timer = new Timer.periodic(Duration(seconds: 10), (Timer timer) {
      setState(() {
        if( s_photos < path.length-1)
          s_photos++;
        else
          s_photos=0;
      });
    });
    timer2 = new Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        _visible = !_visible;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    timer2.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedOpacity(
            opacity: _visible ? 0.8 : 0.0,
            duration: Duration(seconds: 5),
            child: Image.asset(ImageSelector(),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width ,)
        )
    );
  }
}