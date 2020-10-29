import 'package:curso/src/Theme/theme.dart';
import 'package:curso/src/Widgets/SlideShow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: MySlideShow()),
          Expanded(child: MySlideShow())
        ],
      )
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      primaricolor: (Provider.of<ThemeChanger>(context).currentTheme == ThemeData.dark()) ?Provider.of<ThemeChanger>(context).currentTheme.accentColor : Color.fromRGBO(126, 1, 64, 1.0) ,  
      secundarycolor: Colors.grey,
      primarybuler: 15,     
      slides: <Widget>[          
        SvgPicture.asset('assets/svg/slide1.svg'),
        SvgPicture.asset('assets/svg/slide2.svg'),
        SvgPicture.asset('assets/svg/slide3.svg'),
        SvgPicture.asset('assets/svg/slide4.svg'),
        SvgPicture.asset('assets/svg/slide5.svg'),
        SvgPicture.asset('assets/svg/slide1.svg'),
        SvgPicture.asset('assets/svg/slide2.svg'),
        SvgPicture.asset('assets/svg/slide3.svg'),
        SvgPicture.asset('assets/svg/slide4.svg'),
        SvgPicture.asset('assets/svg/slide5.svg'),
      ],        
      
    );
  }
}