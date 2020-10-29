import 'package:flutter/material.dart';


class ThemeChanger with ChangeNotifier{

  bool _darkTheme = false;
  bool _customTheme = false;  
  ThemeData _currentTheme ; 

  ThemeChanger(int theme){

    switch(theme){
      //light mode
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      break;
      //Dark mode
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
      break;
      //Custom Mode
      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
      break;

    }


  }

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme (bool value) {
    _customTheme = false;
    _darkTheme = value;
    if(value){
      _currentTheme = ThemeData.dark();
    }else{
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

   set customTheme (bool value) {
    _darkTheme = false;
    _customTheme = value;
    if(value){
      _currentTheme = ThemeData.light();
    }else{
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }



}