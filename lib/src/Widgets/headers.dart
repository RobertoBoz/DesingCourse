import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color.fromRGBO(150, 244, 212, 1)
    );
  }
}

class HeaderBordeCircular extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,      
      decoration: BoxDecoration(
        color: Color.fromRGBO(150, 244, 212, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40)
        )

      ),
    );
  }
}

/// DIagonal Painter
class HeaderDiagonal extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color.fromRGBO(150, 244, 212, 1),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      )
       
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas  canvas, Size size) {
    //Mi paint (lapis) debe tener propiedades.    
    final paint = Paint();
    paint.color = Color.fromRGBO(150, 244, 212, 1);
    paint.style = PaintingStyle.fill; // fill todo lo contenido y stroke solo bordes 
    paint.strokeWidth = 2.0;
    final path = Path();
    //pintando figura
    path.moveTo(0, size.height *0.35 );
    path.lineTo(size.width, size.height *0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.lineTo(0, size.height *0.5);

    canvas.drawPath(path, paint);

      
  } 
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



/// triangulo
class HeaderTriangulo extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color.fromRGBO(150, 244, 212, 1),
      child: CustomPaint(
        painter: _HeaderTrianguloPainter(),
      )
       
    );
  }
}

class _HeaderTrianguloPainter extends CustomPainter{
  @override
  void paint(Canvas  canvas, Size size) {
    //Mi paint (lapis) debe tener propiedades.    
    final paint = Paint();
    paint.color = Color.fromRGBO(150, 244, 212, 1);
    paint.style = PaintingStyle.fill; // fill todo lo contenido y stroke solo bordes 
    paint.strokeWidth = 30.0;
    final path = Path();
    //pintando figura si el path.moveTo no es declarado al inicio se determina que se empezara de x 0 a y 0
    /* Roberto triangulo diagonal hacia arriba
      path.moveTo(0, 0 );
      path.lineTo(size.width, size.height );
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
    
    */
    /* Roberto triangulo diagonal hacia abajo
      path.lineTo(0, size.height );
      path.lineTo(size.width, size.height );
      path.lineTo(0, 0 );
    */
    //opcion optima
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);      
  } 
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPiramide extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color.fromRGBO(150, 244, 212, 1),
      child: CustomPaint(
        painter: _HeaderPiramidePainter(),
      )
       
    );
  }
}

class _HeaderPiramidePainter extends CustomPainter{
  @override
  void paint(Canvas  canvas, Size size) {
    //Mi paint (lapis) debe tener propiedades.    
    final paint = Paint();
    paint.color = Color.fromRGBO(150, 244, 212, 1);
    paint.style = PaintingStyle.fill; // fill todo lo contenido y stroke solo bordes 
    paint.strokeWidth = 2.0;
    final path = Path();
    //pintando figura    
    path.lineTo(0, size.height *0.25);
    path.lineTo(size.width * 0.50 , size.height *0.35);
    path.lineTo(size.width , size.height *0.25);
    path.lineTo(size.width , 0);        
    //path.lineTo(0, size.height *0.5);
    canvas.drawPath(path, paint);      
  } 
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class HeaderCurvo extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color.fromRGBO(150, 244, 212, 1),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      )
       
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas  canvas, Size size) {
    //Mi paint (lapis) debe tener propiedades.    
    final paint = Paint();
    paint.color = Color.fromRGBO(150, 244, 212, 1);
    paint.style = PaintingStyle.fill; // fill todo lo contenido y stroke solo bordes 
    paint.strokeWidth = 20.0;
    final path = Path();
    //pintando figura    
    path.lineTo(0, size.height *0.25);
    //primeros dos valores marcan la cordenada de la curvatura y los siguientes marcan el punto final 
    path.quadraticBezierTo(size.width * 0.50, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);         
    canvas.drawPath(path, paint);      
  } 
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



class HeaderOla extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color.fromRGBO(150, 244, 212, 1),
      child: CustomPaint(
        painter: _HeaderOlaPainter(),
      )
       
    );
  }
}

class _HeaderOlaPainter extends CustomPainter{
  @override
  void paint(Canvas  canvas, Size size) {
    //Mi paint (lapis) debe tener propiedades.    
    final paint = Paint();
    paint.color = Color.fromRGBO(150, 244, 212, 1);
    paint.style = PaintingStyle.fill; // fill todo lo contenido y stroke solo bordes 
    paint.strokeWidth = 20.0;
    final path = Path();
    //pintando figura    
    path.lineTo(0, size.height *0.25);
    //primeros dos valores marcan la cordenada de la curvatura y los siguientes marcan el punto final 
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.50, size.height * 0.25);
    //
    path.quadraticBezierTo(size.width  * 0.75, size.height * 0.20, size.width ,size.height * 0.25);
    //
    path.lineTo(size.width, 0);
      
    canvas.drawPath(path, paint);      
  } 
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final Color colorgradient1;
  final Color colorgradient2;

  const IconHeader({ 
    @required this.icon, 
    @required this.title, 
    @required this.subtitle, 
    this.colorgradient1 = Colors.blue, 
    this.colorgradient2 = Colors.blueGrey,                 
  });
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        _BackgroundHederIcon(colorgradient1: this.colorgradient1 , colorgradient2: this.colorgradient2,),
        Positioned(top: -20,left: -35,child: FaIcon(this.icon, color: Colors.white.withOpacity(0.3), size: size.width * 0.40, ),),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.width * 0.15,width: double.infinity,),
            Text(this.subtitle,style: TextStyle(fontSize: size.width * 0.05,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.bold),),
            SizedBox(height: size.width * 0.04,),
            Text(this.title,style: TextStyle(fontSize: size.width * 0.09,color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.bold,),),
            SizedBox(height: size.width * 0.05,),
            FaIcon(this.icon, color: Colors.white, size: size.width * 0.15, ),
          ],
        )
      ],
    );
  }
}

class _BackgroundHederIcon extends StatelessWidget {

  final Color colorgradient1;
  final Color colorgradient2;

  const _BackgroundHederIcon({@required this.colorgradient1, @required this.colorgradient2});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      decoration: BoxDecoration(        
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(55)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:   Alignment.bottomCenter,
          colors: <Color>[                                           
            this.colorgradient1,
            this.colorgradient2                                
          ]
        )        
      ),
    );
  }
}

// Color.fromRGBO(202, 59, 75, 1) , 
//             Color.fromRGBO(242, 205, 209, 1), 