import 'package:curso/src/Models/ItemBoton.dart';
import 'package:curso/src/Utils/SliverCustomDelegateHeader.dart';
import 'package:curso/src/Widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(      
      body:  MainScroll()
   );
  }
}


class MainScroll extends StatelessWidget {   
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView( 
      physics: BouncingScrollPhysics(),
      slivers:<Widget>[
        SliverPersistentHeader(
          floating:  true,          
          delegate: SliverCustomDelegateHeader(            
            minheight: size.height * 0.35,
            maxheight: size.height * 0.35,
            child:  IconHeader(
              icon:  FontAwesomeIcons.cat,
              title: 'Catálogo de widget',
              subtitle: 'Flutter dev: @GatoTuerto13',
              colorgradient1: Color.fromRGBO(0, 41, 53, 1),
              colorgradient2: Color.fromRGBO(0, 177, 135, 1),
            )           
          )
        ),
        SliverList(          
          delegate: SliverChildListDelegate(            
            mapMenu            
          )
        )
      ]      
    );
  }
}