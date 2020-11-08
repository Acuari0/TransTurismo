import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:transfran/finalview.dart';

String names ;
String lasts;
String mobiles ;
String mobile2s,Fecha,Hora ;


class Input extends StatelessWidget{
  Input(this.language,this.type_service,this.transport,
      this.onlytrans,this.bilingual,this.transport_tasting,
      this.number,this.tasting,this.guides,this.payment);
  final bool language,onlytrans,bilingual,transport_tasting,tasting,guides;
  final int type_service,transport,number,payment;

  String getTypeofService(){
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

  String getTransport(){
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
    return 'Transporter';
  }

  String getTypePayment(){
    if(payment==0)
      return 'Pago Inmediato: 15% de Descuento';
    if(payment==1)
      return 'Pago en 6 Meses: 7% de Descuento';
    return'Pago en 12 Meses: Sin descuento';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(language ? 'Data':'Datos',
        style: TextStyle(color: Colors.black,
        decorationThickness: 20,),) ,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body:Stack(children: [
        Column(
        children: [

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [thebody(language)],
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.grey)
            ),
            onPressed: (){


              if(names.isNotEmpty || lasts.isNotEmpty || mobiles.isNotEmpty || mobile2s.isNotEmpty){
                FlutterOpenWhatsapp.sendSingleMessage("+526461276566", "Nombre: $names\n"
                    "Apellido $lasts\n"
                    "Telefono1: $mobiles\n"
                    "Telefono2: $mobile2s\n"
                    "Idioma: ${language ? 'Ingles':'Español'}\n"
                    "Tipo de Servicio: ${getTypeofService()}\n"
                    "Tipo de Transporte: ${getTransport()}\n"
                    "Solo Transporte: ${onlytrans ? 'si': 'no'}\n"
                    "Guía Bilingue: ${bilingual ? 'si': 'no'}\n"
                    "Transporte y Desgutaciones: ${transport_tasting ? 'si': 'no'}\n"
                    "Número de Pasajeros: ${number}\n"
                    "Adicional Degustaciones: ${tasting ? 'si': 'no'}\n"
                    "Guías: ${guides ? 'si': 'no'}\n"
                    "Pago:${getTypePayment()}\n"
                    "Fecha: $Fecha\n"
                    "Hora: $Hora\n"
                    "Ganador de algun Descuento en la Ruleta: no\n");

                print("Nombre: $names\n"
                    "Apellido $lasts\n"
                    "Telefono1: $mobiles\n"
                    "Telefono2: $mobile2s\n"
                    "Idioma: ${language ? 'Ingles':'Español'}\n"
                    "Tipo de Servicio: ${getTypeofService()}\n"
                    "Tipo de Transporte: ${getTransport()}\n"
                    "Solo Transporte: ${onlytrans ? 'si': 'no'}\n"
                    "Guía Bilingue: ${bilingual ? 'si': 'no'}\n"
                    "Transporte y Desgutaciones: ${transport_tasting ? 'si': 'no'}\n"
                    "Número de Pasajeros: ${number}\n"
                    "Adicional Degustaciones: ${tasting ? 'si': 'no'}\n"
                    "Guías: ${guides ? 'si': 'no'}\n"
                    "Pago:${getTypePayment()}\n"
                    ""
                    "Ganador de algun Descuento en la Ruleta: no\n");


              }
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinalView(language)));
            },
            color: Colors.white,
            child: Text(language ? 'Send' : 'Enviar'),
          )
        ],
      ),SequencesMan(language: language,),],),
        backgroundColor: Color(0xff904090),

    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            Container(height: 50,
              width: 250,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(15.0))
              ),
              child: FlatButton(
                onPressed: () { _selectDate(context);
                Fecha="${selectedDate.day}".split(' ')[0]+"/"
                    +"${selectedDate.month}".split(' ')[0]+"/"
                    +"${selectedDate.year}".split(' ')[0];},
                child: Text("${selectedDate.day}".split(' ')[0]+"/"
                    +"${selectedDate.month}".split(' ')[0]+"/"
                +"${selectedDate.year}".split(' ')[0]),
              ),
            )

    );
  }
}


class MyHomePages extends StatefulWidget {
  MyHomePages({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageStates createState() => _MyHomePageStates();
}

class _MyHomePageStates extends State<MyHomePages> {

  TimeOfDay _fromTime = TimeOfDay.fromDateTime(DateTime.now());

  Future<void> _showTimePicker(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _fromTime,

    );
    if (picked != null && picked != _fromTime) {
      setState(() {
        _fromTime = picked;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Container(height: 50,
          width: 250,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(15.0))
          ),
          child: FlatButton(
            onPressed: () { _showTimePicker(context);
            Hora="${_fromTime.hour}"+":"+"${_fromTime.minute}";},
            child: Text("${_fromTime.hour}"+":"+"${_fromTime.minute}"),
          ),
        )
    );
  }
}


class thebody extends StatelessWidget{
  final bool language;
  thebody(this.language);

  @override
  Widget build(BuildContext context) {
   return Row(
     children: [
       Column(

         children: [
           InputBox(
               language ? 'Name' : 'Nombre',
               language,
               true,0),
           SizedBox(height: 20,),
           InputBox(
               language ? 'Mobile Number' : 'Número de Celular',
               language,
               false,1),
           SizedBox(height: 20,),
           Container(height: 20,
             width: 250,
             child:Text(language ? 'Select Date' : 'Seleccione la fecha',
               style: TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                   fontWeight: FontWeight.bold
               ),), ),
           MyHomePage()
         ],
       ),
       SizedBox(width: 60,),
       Column(

         children: [
           InputBox(
               language ? 'Last Name' : 'Apellido',
               language,
               true,2),
           SizedBox(height: 20,),
           InputBox(
               language ? 'Second Mobile Number ' : 'Número de Celular 2',
               language,
               false,3),
           SizedBox(height: 20,),
           Container(height: 20,
             width: 250,
             child:Text(language ? 'Select the Hour' : 'Seleccione la Hora',
               style: TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                   fontWeight: FontWeight.bold
               ),), ),
           MyHomePages()
         ],
       ),
     ],
   );
  }

}



class InputBox extends StatefulWidget {

  final String text;
  final bool language;
  final bool type;
  final int index;
  InputBox(
      this.text,
      this.language,
      this.type,
      this.index);
  @override
  InputBox_state createState() => InputBox_state(text,language,type,index);
}


class InputBox_state extends State<InputBox>{

  final String text;
  final bool language;
  final bool type;
  final int index;
  final TextEditingController controller = new TextEditingController();

  InputBox_state(
      this.text,
      this.language,
      this.type,
      this.index);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 20,
          width: 250,
          child:Text(text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            fontWeight: FontWeight.bold
          ),), ),

        Container(height: 50,
          width: 250,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
          Radius.circular(15.0))
          ),
          child:TextFormField(
          controller: controller,
          keyboardType: type ? TextInputType.text : TextInputType.number,
          onChanged: (text){
            setState(() {
              if(index==0)
                names=controller.text;
              if(index==1)
                mobiles=controller.text;
              if(index==2)
                lasts=controller.text;
              if(index==3)
                mobile2s=controller.text;

            });
          },

        ) ,)

      ],
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

