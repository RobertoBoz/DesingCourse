import 'package:curso/src/Widgets/radial_progress.dart';
import 'package:flutter/material.dart';



class GraficaCircularesPage extends StatefulWidget {
  GraficaCircularesPage({Key key}) : super(key: key);

  @override
  _GraficaCircularesPageState createState() => _GraficaCircularesPageState();
}

class _GraficaCircularesPageState extends State<GraficaCircularesPage>  {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(        
        child: Icon(Icons.refresh),
        onPressed: (){
          porcentaje +=10;  
          setState(() {});
          if(porcentaje > 100){
            porcentaje = 0;
          }
        }
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.red),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.purple),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.green)
            ],
          ),
        ],
        
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final double porcentaje;
  final Color color;

  const CustomRadialProgress({
    @required this.color,
    @required this.porcentaje,
  }) ;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,        
      child: RadiaProgress(porcentaje: porcentaje, colorPrimario: this.color, ),
    );
  }
}