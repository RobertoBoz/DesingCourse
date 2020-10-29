import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cursorefactor/src/Page/HomePage/Widgets/ButtonMenu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final String ruta;
  ItemBoton( this.icon, this.texto, this.color1, this.color2, this.ruta);
}

List<Widget> mapMenu = items.map(
  (item) => FadeInLeft(
    duration: Duration(milliseconds: 250),
    child: BtnMenu(
      icon: item.icon, 
      buttoName: item.texto, 
      colorbackground1: item.color1,
      colorbackground2: item.color2,
      onPress: null,
      ruta: item.ruta,
    ),
  )
).toList();

final items = <ItemBoton>[
  new ItemBoton( FontAwesomeIcons.idCard, 'Card',  Color.fromRGBO(0, 177, 135, 1)   ,Color.fromRGBO(0, 41, 53, 1),  'card' ),
  new ItemBoton( FontAwesomeIcons.idCard, 'Flutter Widget Al Detalle',  Color.fromRGBO(101, 218, 226, 1) ,Color.fromRGBO(26, 29, 82, 1),'detalle' ),
  new ItemBoton( FontAwesomeIcons.idCard, 'Motor Accident',  Color.fromRGBO(232, 1, 143, 1)   ,Color.fromRGBO(117, 1, 134, 1),'cards' ),
  new ItemBoton( FontAwesomeIcons.idCard, 'Motor Accident',  Color.fromRGBO(87, 69, 85, 1)    ,Color.fromRGBO(38, 30, 67, 1),'cards' ),
  new ItemBoton( FontAwesomeIcons.idCard, 'Motor Accident',  Color.fromRGBO(215, 153, 96, 1)  ,Color.fromRGBO(22, 16, 28, 1),'cards' ),
  new ItemBoton( FontAwesomeIcons.idCard, 'Motor Accident',  Color.fromRGBO(154, 147, 215, 1) ,Color.fromRGBO(6, 31, 96, 1),'cards' ),
  new ItemBoton( FontAwesomeIcons.idCard, 'Motor Accident',  Color.fromRGBO(157, 136, 109, 1) ,Color.fromRGBO(39, 112, 105, 1),'cards' ),
  // new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
  
];