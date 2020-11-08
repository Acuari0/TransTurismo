import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'cost.dart';


int service=2;
bool s1=false,s2=false,s3=false;
String aux;

class SelectTransport extends StatelessWidget {
  final bool language;
  final int type_of_service;


  SelectTransport(this.language, this.type_of_service);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(language ? 'Select your Transport' : 'Seleccione su transporte',
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
           icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: (){Navigator.pop(context);},
          ),
        ),
      body: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child:Stack(
              children: <Widget>[
                Center(child: Container(color: Colors.white,),),
                Image.asset('images/service/fondo2.png' ,
                  alignment: Alignment.topRight,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width ,),
                Scrollbar(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(child: Box()),
                    Container(child:Inferior_part(language,type_of_service),)],
                ),),SequencesMan(language: language,)
              ],
            )
        ),
      );
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
            s1=isSwitched;
          if(index==1)
            s2=isSwitched;
          if(index==2)
            s3=isSwitched;
        });
      },
      activeTrackColor: Color(0xff904090),
      activeColor: Color(0xff561848),
    );
  }
}

class Box_Text_Switch extends StatelessWidget{
  final String descrip;
  final int index;
  Box_Text_Switch(this.descrip,this.index);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      MyApp(index),
      Text(descrip)
    ],);
  }
}

class Submit extends StatefulWidget {
  final bool language;
  final int typeofservice;
  Submit(this.language, this.typeofservice);
  @override
  Submit_State createState() => Submit_State(language,typeofservice);
}


class Submit_State extends State<Submit>{
  final bool language;
  final int typeofservice;
  Submit_State(this.language, this.typeofservice);

  final TextEditingController number = new TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    number.dispose();
    super.dispose();
  }

  String getHintText(int index){
    if(index==0)
      return language ? 'Enter number of passengers' : 'Ingrese el Número de pasajeros';
    if(index==1)
      return language ? 'Please enter the number of passengers' : 'Por favor ingrese el número de pasajeros';
    return language ? 'Submit' : 'Continuar';
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(child:Check_box(language)),
        SizedBox(width: 10,),
        Container(child: Row (mainAxisAlignment: MainAxisAlignment.center,
          children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(getHintText(0),
              style: TextStyle( fontSize: 15),),
            Container(
              height: 30,
              width: 100,
              child: TextFormField(
                controller: number,
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.isEmpty)
                    return null;
                  return getHintText(1);
                },
              ),
            ),
          ],
        ),
            SizedBox(width: 90,),
            FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.grey)
          ),
          onPressed: (){
            setState(() {
              aux=number.text;
            });
            if( number.text.isNotEmpty && int.parse(number.text)!=0)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cost(language,typeofservice,service,s1,s2,s3,int.parse(aux))),
              );
              //pasar las cosas
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TypeofService2(language)),
              );*/
          },
          child: Text(getHintText(3)),
        )],)),



      ],
    );
  }
}

class Inferior_part extends StatelessWidget{
  final bool language;
  final int typeofservice;
  Inferior_part(this.language,this.typeofservice);
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Container(child: Submit(language,typeofservice)),
      ],
    );
  }

}


class Check_box extends StatelessWidget{
  final bool language;
  Check_box(this.language);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Box_Text_Switch(language ? 'Only transport': 'Solo Transporte',0),
        SizedBox(width: 10,),
         Box_Text_Switch(language ? 'Bilingual Guide': 'Guia Bilingue',1),
        SizedBox(width: 10,),
         Box_Text_Switch(language ? 'Transport & Tasting': 'Transporte y Degustaciones',2),
      ],
    );
  }
}


class Boxer extends State<Box> with TickerProviderStateMixin{


  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {

    super.dispose();

  }

  bool isColor1=false;
  bool isColor2=true;
  bool isColor3=true;
  bool isColor4=true;
  bool isColor5=true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 30,),
                FlatButton(
                    color: isColor1 ? Color(0xff561848) :Colors.blueAccent ,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(2.0),
                    splashColor: Colors.blueAccent,
                    onPressed: (){
                      setState(() {
                        service=2;
                         isColor1=false;
                         isColor2=true;
                         isColor3=true;
                         isColor4=true;
                         isColor5=true;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey)
                    ),
                    child:
                        Container(
                          padding: EdgeInsets.all(10),
                            child:Image.asset('images/transport/sedan.png')
                       
                    )
                ),
                SizedBox(width: 30,),
                FlatButton(
                    color: isColor2 ? Color(0xff561848) :Colors.blueAccent ,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(2.0),
                    splashColor: Colors.blueAccent,
                    onPressed: (){
                      setState(() {
                        service=3;
                         isColor1=true;
                         isColor2=false;
                         isColor3=true;
                         isColor4=true;
                         isColor5=true;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey)
                    ),
                    child: Container(
                        padding: EdgeInsets.all(10),
                            child:Image.asset('images/transport/crafter.png')
                        ),

                ),
                SizedBox(width: 30,),
                FlatButton(
                    color: isColor3 ? Color(0xff561848) :Colors.blueAccent ,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(2.0),
                    splashColor: Colors.blueAccent,
                    onPressed: (){
                      setState(() {
                        service=4;
                         isColor1=true;
                         isColor2=true;
                         isColor3=false;
                         isColor4=true;
                         isColor5=true;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey)
                    ),
                    child:
                        Container(
                            padding: EdgeInsets.all(10),
                            child:Image.asset('images/transport/suburban.png')
                        ),

                ),

                SizedBox(width: 30,),
              ],
            ),
        ),
        SizedBox(height: 20,),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30,),
              FlatButton(
                  color: isColor4 ? Color(0xff561848) :Colors.blueAccent ,
                  textColor: Colors.black,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(2.0),
                  splashColor: Colors.blueAccent,
                  onPressed: (){
                    setState(() {
                      service=5;
                       isColor1=true;
                       isColor2=true;
                       isColor3=true;
                       isColor4=false;
                       isColor5=true;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey)
                  ),
                  child:
                      Container(
                          padding: EdgeInsets.all(10),
                          child:Image.asset('images/transport/toyota.png')
                      ),

              ),
              SizedBox(width: 30,),
              FlatButton(
                  color: isColor5 ? Color(0xff561848) :Colors.blueAccent  ,
                  textColor: Colors.black,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(2.0),
                  splashColor: Colors.blueAccent,
                  onPressed: (){
                    setState(() {
                      service=6;
                       isColor1=true;
                       isColor2=true;
                       isColor3=true;
                       isColor4=true;
                       isColor5=false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey)
                  ),
                  child:
                      Container(
                          padding: EdgeInsets.all(10),
                          child:Image.asset('images/transport/transporter.png')
                      ),

              ),
              SizedBox(width: 30,),

            ],
          ),
        )
      ],
    );
  }

}

class Box extends StatefulWidget{


  Box({Key key}) : super (key : key);
  Boxer createState() => Boxer();
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
