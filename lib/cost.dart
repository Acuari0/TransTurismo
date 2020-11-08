import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transfran/roulette.dart';


bool s2=false,s3=false;
int payment=0;


class Cost extends StatelessWidget{
  final bool language,onlytrans,bilingual,transport_tasting;
  final int type_service,transport,number;
  Cost(this.language,this.type_service,this.transport,
      this.onlytrans,this.bilingual,this.transport_tasting,
      this.number);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(language ? 'Add more Services':'Añade mas Servicios',
          style: TextStyle(color: Colors.black,
            decorationThickness: 20,),) ,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body:Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(

              children: [
                SuperiorPart(language),
                SizedBox(width: 30,height: 30,),
                InferiorPart(language,type_service,transport),
                SizedBox(width: 10,height: 10,),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey)
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => roulette_info(language,type_service,transport,onlytrans,bilingual,transport_tasting,number,s2,s3,payment)),
                    );
                  },
                  color: Colors.white,
                  child: Text(language ? 'Continue' : 'Continuar'),
                )
              ],
            ),

          ],
        ),SequencesMan(language: language,),],),
      backgroundColor: Color(0xff904090),
    );
  }
}

class InferiorPart extends StatelessWidget{
  final bool language;
  final int type_service, transport;
  InferiorPart(this.language,this.type_service,this.transport);

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Column(
          children: [
            Container(
              child: Text(language ? 'Details':'Detalles',
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20)
              ),
            ),
            SizedBox(height: 10,),
            details(language, 0, 0,type_service,transport),
            details(language, 1, 1,type_service,transport),
            details(language, 2, 2,type_service,transport),
            details(language, 3, 3,type_service,transport),
          ],
        ),
        SizedBox(width: 50,),
        Column(
          children: [
            Container(
              child: Text(language ? 'Payments':'Tipo de Pago',
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20)
              ),
            ),
            RadioButtonPayment(language)
          ],
        ),
      ],
    );
  }

}

class RadioButtonPayment extends StatefulWidget{
  final bool language;
  RadioButtonPayment(this.language);

  RadioButton createState() => RadioButton(language);
}

class RadioButton extends State<RadioButtonPayment>{
  final bool language;
  RadioButton(this.language);

  int _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        _myRadioButton(
          title: language ? 'Pay now= 15% off' : 'Paga ahora= 15% menos',
          value: 0,
          onChanged: (newValue){
            setState(() => _groupValue = newValue);
            payment=_groupValue;
            },
        ),
        _myRadioButton(
          title: language ? 'Pay in 6 months= 7% off' : 'Paga en 6 meses= 7% menos',
          value: 1,
          onChanged: (newValue){
            setState(() => _groupValue = newValue);
            payment=_groupValue;
            },
        ),
        _myRadioButton(
          title: language ? 'Pay in 12 months = No discount' : 'Paga en 12 meses= Sin Descuento',
          value: 2,
          onChanged: (newValue){
            setState(() => _groupValue = newValue);
            payment=_groupValue;
          },
        ),
      ],
    );
  }

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return Container(
      height: 30,
      width: 340,
      child: RadioListTile(

      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title, style: TextStyle(color: Colors.white)),
    ),);
  }
}

class details extends StatelessWidget{
  final bool language;
  final int index, value;
  final int type_service, transport;
  details(this.language,this.index,this.value,this.type_service,this.transport);

  String getIndexText(){
    if(index==0)
      return language ? 'Kind of Vehicle:':'Tipo de Vehiculo:';
    if(index==1)
      return language ? 'Max Capacity:':'Capacidad Maxima:';
    if(index==2)
      return language ? 'Model:':'Modelo:';
    return language ? 'Service Selected:':'Servicio Seleccionado:';
  }

  String getValueText(){
    if (value==0){
      if(transport==0)
        return 'Taxi';
      if(transport==1)
        return language ?'Minibus': 'Colectivo';
      if(transport==2)
        return language ?'Sedan': 'Sedan';
      if(transport==3)
        return 'Crafter';
      if(transport==4)
        return 'Suburban';
      if(transport==5)
        return 'Hiace';
      if(transport==6)
        return 'Transporter';
    }
    if (value==1){
      if(transport==0)
        return 'Taxi Cap.';
      if(transport==1)
        return 'Cap.';
      if(transport==2)
        return '4';
      if(transport==3)
        return '40';
      if(transport==4)
        return '5';
      if(transport==5)
        return '20';
      if(transport==6)
        return '4';
    }
    if (value==2){
      if(transport==0)
        return 'Taxi';
      if(transport==1)
        return language ?'Minibus': 'Colectivo';
      if(transport==2)
        return 'Sedan';
      if(transport==3)
        return 'Volkswagen';
      if(transport==4)
        return 'Chevrolet';
      if(transport==5)
        return 'Toyota';
      if(transport==6)
        return 'Volkswagen';
    }
    if (value==3){
      if(type_service==5)
        return 'Taxi';
      if(type_service==4)
        return language ?'Minibus': 'Colectivo';
      if(type_service==0)
        return language ?'Tours in the Route of Wine' : 'Tours en la Ruta del Vino';
      if(type_service==1)
        return language ? 'Tour Artesanal Beer' : 'Tour Cerveza Artesanal';
      if(type_service==3)
        return language ? 'Ecoturism and Familiar' : 'Ecoturismo y Familiar';
      if(type_service==3)
        return language ? 'Ecoturism and Familiar' : 'Ecoturismo y Familiar';
      if(type_service==7)
        return language ? 'Bike' : 'Moto';
      if(type_service==8)
        return language ? 'Climb' : 'Escalada';
      if(type_service==9)
        return language ? 'Helicopter' : 'Helicoptero';
      if(type_service==10)
        return language ? 'Zipeline' : 'Tirolesa';
      return 'Kayak';
    }
  }
  @override
  Widget build(BuildContext context) {
   return Row(
     children: [
       Container(
         width: 160,
         height: 20,
         child: Text(getIndexText(),
           style: TextStyle(color: Colors.white,
               fontWeight: FontWeight.w700),
         ),
       ),
       Container( width: 100,
         height: 20,
         child: Text(getValueText()
       ,style: TextStyle(color: Colors.white)),)
     ],
   );
  }

}


class SuperiorPart extends StatelessWidget{
  final bool language;
  SuperiorPart(this.language);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 150,
              height: 150,
              child: Image.asset('images/selectle/logo.png'),
            ),
            SizedBox(width: 30,height: 30,),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('images/cost/came1.png'),
                ),
                SizedBox(width: 10,),
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('images/cost/came2.png'),
                ),
                SizedBox(width: 10,),
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('images/cost/came3.png'),
                ),
              ],
            )
          ],
        ),
        SizedBox(width: 100,),
        Column(children: [
          SizedBox(width: 20,height: 20,),
          Container(
            child: Text(language ? 'Add more services' : 'Añade mas servicios',
              style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w700),
            ),

          ),
          SizedBox(width: 10,height: 10,),
          Box_Text_Switch(language ? 'Tasting=':'Degustaciones=', 0),
          Box_Text_Switch(language ? 'Guides=':'Guías=', 1),
          SizedBox(width: 10,height: 10,),
          Container(
            child: Text(language ? 'Total Price = 1000 MXN' : 'Precio Total = 1000 MXN',
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w700,fontSize: 20),
            ),
          ),
        ],)
      ],
    );
  }

}

class Box_Text_Switch extends StatelessWidget{
  final String descrip;
  final int index;
  Box_Text_Switch(this.descrip,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        height: 30,
        child:Row(children: [
           MyApp(index),
           Text(descrip,
          style: TextStyle(color: Colors.white))
    ],));
  }
}


class MyApp extends StatefulWidget {
  final int index;
  MyApp(this.index);
  @override
  _State createState() => _State(index);
}

class _State extends State<MyApp> {
  bool isSwitched = false;
  final int index;
  _State(this.index);
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
          if(index==0)
            s2=isSwitched;
          if(index==1)
            s3=isSwitched;
          if(index==2)
            s3=isSwitched;
        });
      },
      activeTrackColor: Colors.blue,
      activeColor: Colors.blueAccent,
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
  double number =300;
  final bool language;
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
        height: other2 ? null : number,
        alignment: Alignment.bottomRight,
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
          child: Image.asset(language ? 'images/transport/entrans.png' : 'images/transport/estransport.png'),

        )
    );

  }
}