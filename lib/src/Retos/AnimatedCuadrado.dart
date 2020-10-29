import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AnimatedCuadradoPage extends StatelessWidget {
  const AnimatedCuadradoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadroAnimado(),
      ),
    );
      
  }
}

class CuadroAnimado extends StatefulWidget {

  @override
  _CuadroAnimadoState createState() => _CuadroAnimadoState();
}

class _CuadroAnimadoState extends State<CuadroAnimado> with SingleTickerProviderStateMixin{

  AnimationController controller;

  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;

  
  //Animaciones

  @override
  void initState() {

    controller = new AnimationController(vsync: this,duration: Duration(milliseconds: 4000));

    moverDerecha = Tween(begin:0.0,end:70.0).animate(CurvedAnimation(parent: controller,curve:Interval(0, 0.25))) ;  

    moverArriba = Tween(begin:0.0,end:70.0).animate(CurvedAnimation(parent: controller,curve:Interval(0.25, 0.50))) ;  

    moverIzquierda = Tween(begin:0.0,end:140.0).animate(CurvedAnimation(parent: controller,curve:Interval(0.50, 0.75))) ;  

    moverAbajo = Tween(begin:0.0,end:140.0).animate(CurvedAnimation(parent: controller,curve:Interval(0.75, 1))) ;  

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
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
       child: _Rectangulo(),
       builder: (BuildContext context, Widget childCuadro) {
          return Transform.translate(
                  offset: Offset(0, moverAbajo.value),
                  child: Transform.translate(
                    offset: Offset(-moverIzquierda.value, -moverArriba.value),
                      child: Transform.translate(
                        offset: Offset(moverDerecha.value, -moverArriba.value),
                        child: Transform.translate(
                        offset: Offset(moverDerecha.value, 0),
                        child: childCuadro,
                      ),
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