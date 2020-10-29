import 'dart:math';

import 'package:flutter/material.dart';

class RadiaProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorFondo;

  const RadiaProgress({
    @required this.porcentaje,
    this.colorPrimario = Colors.green, 
    this.colorSecundario = Colors.black,
    this.grosorPrimario = 10.0,  
    this.grosorFondo = 2.0,       
  });


  @override
  _RadiaProgressState createState() => _RadiaProgressState();
}

class _RadiaProgressState extends State<RadiaProgress> with SingleTickerProviderStateMixin{

  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(vsync: this,duration: Duration(milliseconds: 200));

    
    super.initState();
  }

  @override
  void dispose() {

    controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;   
    porcentajeAnterior = widget.porcentaje;

    print('$diferenciaAnimar');
     print('$widget.porcentaje');
    return AnimatedBuilder(
    animation: controller,      
      builder: (BuildContext context, Widget child){
            return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgressPainter(
                (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
                 widget.colorPrimario,
                 widget.colorSecundario,
                 widget.grosorPrimario,
                 widget.grosorFondo,
                 
              ),

            )
        ); 
      }
    );    
  }
}

class _MiRadialProgressPainter  extends CustomPainter{

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorfondo;
  
  

  _MiRadialProgressPainter(this.porcentaje, this.colorPrimario, this.colorSecundario,  this.grosorPrimario, this.grosorfondo,);

  @override
  void paint(Canvas canvas , Size size) {    
    final paint = new Paint()
      ..strokeWidth = grosorfondo
      ..color       = colorSecundario
      ..style       = PaintingStyle.stroke;
      final center = new Offset(size.width * 0.5, size.height / 2);
      final radio = min(size.width * 0.5, size.height *0.5);
      canvas.drawCircle(center,radio,paint);
    final paintllenado = new Paint()
    ..strokeWidth = grosorPrimario
    ..color       = colorPrimario
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
