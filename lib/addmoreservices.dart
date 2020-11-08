import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:transfran/selecttranspor.dart';

class TypeofService2 extends StatelessWidget{
  final bool language;
  final int type;
  TypeofService2(this.language,this.type);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(language ? 'Choose your Adventure' : 'Seleccione su Aventura',
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          actions: <Widget>[
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: (){Navigator.pop(context);},
          ),
        ),
        body: Stack(children: [Center(child: Container(color: Colors.white,),),
          Image.asset('images/service/fondo2.png' ,
            alignment: Alignment.topRight,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width ,),
          Center(child:Services(language) ,)
        ],)
    );
  }

}

class Services extends StatelessWidget{
  bool language;
  Services(this.language);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget> [
        Container(
          padding: EdgeInsets.all(20) ,
          alignment: Alignment.center,
          child: Container(child: Column(
            children: [
              Row(
                children: [
                  Container(width: 170,child: Buttons(language, 6)),
                  SizedBox(width: 40,),
                  Container(child: Buttons(language, 9)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(width: 170,child: Buttons(language, 7)),
                  SizedBox(width: 40,),
                  Container(child: Buttons(language, 10)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(child: Buttons(language, 8)),

                ],
              ),

            ],

          ),) ,)



        ,SequencesMan(language: language,),],

    );

  }
}

// Sequency
class SequencesMan extends StatefulWidget{

  final bool language;
  SequencesMan({Key key, this.language}) : super (key : key);
  Sequences_State_man createState() => Sequences_State_man(language);
}

//States Sequency
class Sequences_State_man extends State<SequencesMan> with TickerProviderStateMixin {

  Timer timer;
  bool _visible = true,other=true,other2=true;
  final bool language;
  double number =300;

  Sequences_State_man(this.language);


  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        if(!_visible){
          timer.cancel();
        }
        _visible = !_visible;
      });
    });
  }


  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.bottomRight,
        height: other2 ? null : number,
        child: AnimatedOpacity(
            opacity: _visible ? 0.0 : 1,
            duration: Duration(seconds: 1),
            onEnd: (){
              setState(() {
                if(other)
                  other=false;
                else {
                  number = 0;
                  other2=false;
                }
              });
            },
            child: Image.asset(language ? 'images/moreserv/engmen.png': 'images/moreserv/esmen.png')

        )
    );

  }
}
class Buttons extends StatelessWidget{
  final bool language;
  final int value;
  Buttons(this.language, this.value);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectTransport(language,value)),
          );
        },
        child: Row(
          children: [
            Image.asset(getPath(value),height: 70,width: 70,),
            SizedBox(width: 20,),
            Container(child: getText(language, value),
            )

          ],
        ));
  }

}
//item
class Item{
  const Item({
    this.icon_list,
    this.text
  });
  final Icon icon_list;
  final Text text;
}
//getText
Text getText(bool language, int index){
  if(index==7)
    return language ? Text('Bike') : Text('Moto');
  if(index==8)
    return language ? Text('Climb') : Text('Escalada');
  if(index==9)
    return language ? Text('Helicopter') : Text('Helicoptero');
  if(index==10)
    return language ? Text('Zipeline') : Text('Tirolesa');
  return Text('Kayak');
}

String getPath(int index){
  if(index==7)
    return 'images/moreserv/bike.png';
  if(index==8)
    return 'images/moreserv/climb.png';
  if(index==9)
    return 'images/moreserv/heli.png';
  if(index==10)
    return 'images/moreserv/zip.png';
  return 'images/service/taxi.png';


}