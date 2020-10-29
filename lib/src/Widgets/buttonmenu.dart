
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BtnMenu extends StatelessWidget {
  
  final IconData icon;
  final String buttoName;
  final Color colorbackground1;
  final Color colorbackground2;
  final Function onPress;
  

  const BtnMenu({
    @required this.icon, 
    @required this.buttoName, 
    this.colorbackground1 = Colors.blueGrey, 
    this.colorbackground2 = Colors.blue, 
    @required this.onPress
  });

  @override
  Widget build(BuildContext context) {    
    final size = MediaQuery.of(context).size;
    return  GestureDetector(
      onTap: this.onPress,
      child: Container(
          width: double.infinity,
          height: size.width * 0.30, 
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),        
              child: Stack(
                children: <Widget>[
                    Positioned(
                      right: -20,
                      top: -20,
                      child: FaIcon(this.icon,size: size.width * 0.35, color: Colors.white.withOpacity(0.3),) ,
                    ),
                   Container(
                    margin: EdgeInsets.only(top: size.width*0.085),
                    child: Row(                
                      children: <Widget>[
                        SizedBox( width: size.width * 0.04),
                        FaIcon(this.icon,size: size.width * 0.12, color: Colors.white,) ,
                        SizedBox( width: size.width * 0.03),
                        Text(this.buttoName, style: TextStyle(color: Colors.white,fontSize: size.width * 0.06,fontWeight: FontWeight.bold)),                                                     
                        // SizedBox( width: size.width * 0.03),
                      ],
                    ),
                   ),
                   Container(
                    margin: EdgeInsets.only(top: size.width*0.115,left:size.width*0.80 ),
                    child: FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white,)
                   ) ,  
                ],
              ),
            ),        
          margin: EdgeInsets.only(left: 20,right:20,bottom: 15,top: 15),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10
              )          
            ],
            gradient: LinearGradient(
              colors: <Color>[
                this.colorbackground1, 
                this.colorbackground2, 
              ]
            )
          ),    
      ),
    );
  }
}


