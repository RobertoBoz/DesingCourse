import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CircularProgessPage extends StatefulWidget {
  CircularProgessPage({Key key}) : super(key: key);

  @override
  _CircularProgessPageState createState() => _CircularProgessPageState();
}

class _CircularProgessPageState extends State<CircularProgessPage> with SingleTickerProviderStateMixin{

  double porcentajeNuevo = 0.0;
  double porcentaje = 0.0;
  AnimationController controller;

  @override
  void initState() {
    controller = new AnimationController(vsync: this,duration:Duration(milliseconds: 800));

    controller.addListener(() {
      //print('valor controller: ${controller.value}');
      
      setState(() {
        porcentaje = lerpDouble(porcentaje, porcentajeNuevo, controller.value);  
      });

    });
    
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.redAccent,
        onPressed: (){
          
          controller.forward(from: 0.0);
         setState(() {
            porcentaje = porcentajeNuevo;
            porcentajeNuevo+=10;
            if(porcentajeNuevo > 100){
              porcentajeNuevo = 0;
              porcentaje= 0;
            }
            
         });
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300,        
          height: 300,
          //color: Color.fromRGBO(150, 244, 212, 1),          
          child: CustomPaint(
            painter: _MiRadialProgressPainter(porcentaje),
          ),
          
        ),
      )
    );
  }
}

class _MiRadialProgressPainter  extends CustomPainter{

  final porcentaje;

  _MiRadialProgressPainter(this.porcentaje);

  @override
  void paint(Canvas canvas , Size size) {

    
    final paint = new Paint()
      ..strokeWidth = 2
      ..color       = Colors.black
      ..style       = PaintingStyle.stroke;
      final center = new Offset(size.width * 0.5, size.height / 2);
      final radio = min(size.width * 0.5, size.height *0.5);
      canvas.drawCircle(center,radio,paint);

    final paintllenado = new Paint()
    ..strokeWidth = 20
    ..color       = Colors.red
    ..style       = PaintingStyle.stroke;
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius:radio), 
      -pi/2, 
      arcAngle, 
      false, 
      paintllenado
    );


  }
  
  

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
