import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;


final menuProvider = new _MenuProvider(); 

class _MenuProvider{

  List<dynamic> opc = [];
  
  _MenuProvider(){
    loadopc();
  }

  Future<List<dynamic>> loadopc() async {
    final resp = await rootBundle.loadString('data/menu.json');        
    Map datMap = json.decode(resp);      
    return  opc = datMap['rutas'];
  }


}