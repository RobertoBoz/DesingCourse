import 'package:curso/src/Pages/HomePage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/Theme/theme.dart';



void main() =>
  runApp(
    ChangeNotifierProvider(
      create: (_) => new ThemeChanger(1),
      child: MyApp()
    )
  );


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    


    return MaterialApp(
      theme: Provider.of<ThemeChanger>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'HeadersPage',
      home: HomePage(),
    );
  }
}

