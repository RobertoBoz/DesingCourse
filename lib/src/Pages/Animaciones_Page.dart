import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: CuadradoAnimado(),
      )
    );
  }
}

class CuadradoAnimado extends StatefulWidget {

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  AnimationController controller;

  Animation<double> rotacion;

  Animation<double> opacidad;
  Animation<double> opacidadOut;

  Animation<double> moverDerecha;
  Animation<double> agrandar;

  

  @override
  void initState() { 
    controller = new AnimationController(vsync: this,duration: Duration(milliseconds:  4000));
    // rotacion = Tween( begin: 0.0 , end: 2 * Math.pi).animate(controller);

    rotacion = Tween( begin: 0.0 , end: 2 * Math.pi).animate(CurvedAnimation(parent: controller, curve: Curves.easeInBack));

    opacidad = Tween(begin:0.1 ,end:1.0).animate(CurvedAnimation(parent: controller, curve: Interval(0,0.25)));

    opacidadOut = Tween(begin:1.0 ,end:0.0).animate(CurvedAnimation(parent: controller, curve: Interval(0,0.85)));

    moverDerecha = Tween(begin: 0.0,end: 200.0).animate(controller);

    agrandar = Tween(begin: 0.0, end:2.0).animate(controller);

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed){
        controller.reverse();
        controller.repeat();
      }
    });
     controller.forward();
   
    super.initState();    
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {   
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        print('valor {opacidad.value}');
        return Opacity(
            opacity: opacidadOut.value,
            child: Transform.translate(
            offset: Offset(moverDerecha.value, 0),
            child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: opacidad.value,
                child: Transform.scale(
                  scale: agrandar.value,
                  child: childRectangulo
                )
              )
            ),
          ),
        );
      },
    );
  }
}




















class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}