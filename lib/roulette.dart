import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'dart:math';

import 'package:transfran/input.dart';


class roulette_info extends StatelessWidget {
  roulette_info(this.language,this.type_service,this.transport,
      this.onlytrans,this.bilingual,this.transport_tasting,
      this.number,this.tasting,this.guides,this.payment);
  final bool language,onlytrans,bilingual,transport_tasting,tasting,guides;
  final int type_service,transport,number,payment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(language ? 'Instant Discounts Awaits you!':'Ganate un Descuento!',
        style: TextStyle(color: Colors.black,
        decorationThickness: 20,),) ,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row_left(language),
              SizedBox(width: 30,),
              Container(
                width: 5,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                color: Colors.white,
              ),
              SizedBox(width: 30,),
              Row_right(language,type_service,transport,onlytrans,bilingual,transport_tasting,number,tasting,guides,payment )
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xff904090),
    );
  }
}

class Row_left extends StatelessWidget{
  final bool language;
  Row_left(this.language);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SequencesMan(language: language)
      ],
    );
  }
}

class Row_right extends StatelessWidget{
  Row_right(this.language,this.type_service,this.transport,
      this.onlytrans,this.bilingual,this.transport_tasting,
      this.number,this.tasting,this.guides,this.payment);
  final bool language,onlytrans,bilingual,transport_tasting,tasting,guides;
  final int type_service,transport,number,payment;

  String getText(){
      return language ? 'An incredible trip. Thanks @Transturismo #VDG_TT ':
      'Un viaje increíble. Gracias @transturismo #VDG_TT';
  }

  String getText1(){
    return language ? "For obtain, all person in the group \nhave to metioned us in a post\n on instagram or facebook" :
    "Para obtener, todas las personas del grupo \ndeben mencionarnos en una publicación\n en Instagram o Facebook.";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/roulette/friends.png',height: 140,),
        SizedBox(height: 5),
        FittedBox(
        fit:BoxFit.fitWidth,
          child: Text(getText(),textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white))),
        SizedBox(height: 10),
        Row(children: [
          Image.asset('images/roulette/instico.png',height: 50,),
          SizedBox(width: 20,),
          Image.asset('images/roulette/facico.png',height: 50,)
        ],),
        SizedBox(height: 10,),
        Image.asset(language ? 'images/roulette/engmen.png' : 'images/roulette/esmen.png',height: 20,),
        SizedBox(height: 5),
        FlatButton(
          child: Container(padding: EdgeInsets.all(10),
            child: Text(language ? 'Skip' : 'Continuar',
              style: TextStyle(color: Color(0xff561848),),),),
          color:  (Colors.white) ,
          textColor: Colors.black,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(2.0),
          splashColor: Colors.blueAccent,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Input(language,type_service,transport,onlytrans,bilingual,transport_tasting,number,tasting,guides,payment)),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.grey)
          ),
        ),],
    );
  }
}

class Roulette extends State<SequencesMan> with TickerProviderStateMixin {

  final StreamController _dividerController = StreamController<int>();

  final _wheelNotifier = StreamController<double>();

  Roulette(this.language);
  bool canwheel=true;
  bool isawin=false;
  int state_winnertext=0;
  double wheelit;
  final bool language;

  Timer timer;

  String getText(){
    if(canwheel)
      return language ?'Start' : 'Empezar';
    return language ? 'Wait 15 Minutes' : 'Espere 15 Minutos';
  }

  String getWinnerText(){
     if(state_winnertext==0)
       return language ? 'Play the roulette for a Discount!':
       'Juega la ruleta por un Descuento';
     if(state_winnertext==1)
       return language ? 'You Win!, \ntake a photo and solicite a service' :
       'Ganaste!,\n Toma una foto y solicita un servicio';
     return language ? 'You lose, try Again in 15 minutes' :
         'Perdiste, intenta de nuevo en 15 min';
  }

  TextStyle getStyleWinLose( ){
    return isawin ? TextStyle( fontSize: 15, color: Colors.green) :
    TextStyle(fontSize: 15, color: Colors.red);
  }
  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(Duration(minutes: 15), (Timer timer) {
      setState(() {
        if(!canwheel){
          canwheel=true;
        }
      });
    });
  }
  @override
  dispose() {
    super.dispose();
    _dividerController.close();
    _wheelNotifier.close();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinningWheel(
              Image.asset(language ? 'images/roulette/rouletteeng.png' :
              'images/roulette/rouletteesp.png'),
              width: 250,
              height: 250,
              initialSpinAngle:  pi/2,
              spinResistance: 1,
              canInteractWhileSpinning: false,
              dividers: 16,
              onUpdate:_dividerController.add,
              onEnd:_dividerController.add,
              secondaryImage:
              Image.asset('images/roulette/pointer.png'),
              secondaryImageHeight: 50,
              secondaryImageWidth: 50,
              secondaryImageTop: 210,
              shouldStartOrStop: _wheelNotifier.stream,
            ),
            RaisedButton(
              child: new Text(getText()),
              onPressed: () {
                  if(canwheel){
                    _wheelNotifier.sink.add(_generateRandomVelocity());
                    setState(() {
                      canwheel=false;
                      isawin=true;
                    });
                  }
              },
            ),

          ],
        );

  }

  double _generateRandomVelocity() => 50000;

  double _generateRandomAngle() {
    wheelit = /*Random().nextDouble()*/  pi * 2;
    setState(() {

    });
    return wheelit;
  }
}

class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '1000\$',
    2: '400\$',
    3: '800\$',
    4: '7000\$',
    5: '5000\$',
    6: '300\$',
    7: '2000\$',
    8: '100\$',
    9: '1000\$',
    10: '400\$',
    11: '800\$',
    12: '7000\$',
    13: '5000\$',
    14: '300\$',
    15: '2000\$',
    16: '100\$',
  };

  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 0));
  }
}

// Sequency
class SequencesMan extends StatefulWidget{
  final bool language;
  SequencesMan({Key key, this.language}) : super (key : key);
  Roulette createState() => Roulette(language);
}




