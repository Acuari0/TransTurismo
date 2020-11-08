import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transfran/addmoreservices.dart';
import 'package:transfran/cost.dart';
import 'package:transfran/input.dart';
import 'package:transfran/selecttranspor.dart';
import 'roulette.dart';
import 'dart:async';

class TypeofService extends StatelessWidget{
  bool language;
  TypeofService(this.language);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language ? 'Choose your Desired Service' : 'Seleccione el Servicio Deseado',
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
                  Container(width: 290,child: Buttons(language, 0)),
                  Container(child: Buttons(language, 3)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(width: 290,child: Buttons(language, 1)),
                  Container(child: Buttons(language, 4)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(width: 290,child: Buttons(language, 2)),
                  Container(child: Buttons(language, 5)),
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
              child: Image.asset(language ? 'images/service/englishmen.png': 'images/service/esservice.png')

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
      /**value*/
          if(value==0 || value ==1 || value== 3)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectTransport(language,value)),
            );
          if(value==4 )
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cost(language,value,1,false,false,false,0)),
            );
          if(value==5 )
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cost(language,value,0,false,false,false,0)),
            );
          if(value==2)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TypeofService2(language,value)),
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
  if(index==0)
    return language ? Text('Tours in the Route of Wine') : Text('Tours en la Ruta del Vino');
  if(index==1)
    return language ? Text('Tour Artesanal Beer') : Text('Tour Cerveza Artesanal');
  if(index==2)
    return language ? Text('Adventure') : Text('Aventura');
  if(index==3)
    return language ? Text('Ecoturism and Familiar') : Text('Ecoturismo y Familiar');
  if(index==4)
    return language ? Text('Minibus') : Text('Colectivo');
  return Text('Taxi');
}

String getPath(int index){
  if(index==0)
    return 'images/service/vino.png';
  if(index==1)
    return 'images/service/beer.png';
  if(index==2)
    return 'images/service/adventure.png';
  if(index==3)
    return 'images/service/eco.png';
  if(index==4)
    return 'images/service/bus.png';
  return 'images/service/taxi.png';
  
      
}