import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:curso/src/Pages/Animaciones_Page.dart';
import 'package:curso/src/Pages/EmergencyPage.dart';
import 'package:curso/src/Pages/GraficasPage.dart';
import 'package:curso/src/Pages/Headers_page.dart';
import 'package:curso/src/Pages/Slivers_list_Page.dart';
import 'package:curso/src/Pages/pinterest_page.dart';
import 'package:curso/src/Pages/slideshow_page.dart';


final pageRoutes =<_Routes>[

  _Routes(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Routes(FontAwesomeIcons.ambulance,'EmergenciPage', EmergencyPage()),
  _Routes(FontAwesomeIcons.heading,'Encabezados', HeadersPage()),
  _Routes(FontAwesomeIcons.peopleCarry,'CuadroAnimado', AnimacionesPage()),
  _Routes(FontAwesomeIcons.circleNotch,'Progres Bar', GraficaCircularesPage()),
  _Routes(FontAwesomeIcons.pinterest, 'Pinterest Menu', PinterestPage()),
  _Routes(FontAwesomeIcons.mobile, 'Slivers', SliverPage()),


];

class _Routes{
  final IconData icon;
  final String titulo;
  final Widget page;

  _Routes(this.icon, this.titulo, this.page);
}