import 'package:curso/src/Theme/theme.dart';
import 'package:curso/src/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños Flutter'),

      ),
      drawer: _MenuPerson(),
      body: _ListaOpciones()
   );
  }
}

class _ListaOpciones extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    

    return ListView.separated(
      physics: BouncingScrollPhysics(),      
      separatorBuilder: (context,i) => Divider(
        color: Provider.of<ThemeChanger>(context).currentTheme.accentColor,
      ), 
      itemCount: pageRoutes.length,
      itemBuilder: (context,i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: Provider.of<ThemeChanger>(context).currentTheme.accentColor),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon( Icons.chevron_right, color: Provider.of<ThemeChanger>(context).currentTheme.accentColor),
        onTap: (){
          Navigator.push(context,CupertinoPageRoute(builder: (BuildContext context)=> pageRoutes[i].page));
        },
      ), 
    );
  }
}

class _MenuPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
             SafeArea(
               child: Container(
                 padding: EdgeInsets.all(25),
                 width: double.infinity,
                 height: 200,
                 child: CircleAvatar(
                   backgroundColor: Provider.of<ThemeChanger>(context).currentTheme.accentColor,
                   child: Text('RBZ',style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),),
                 ),            
               ),
             ),
             Expanded(
                child: _ListaOpciones()
             ),
             ListTile(
               leading: Icon(Icons.lightbulb_outline , color:Provider.of<ThemeChanger>(context).currentTheme.accentColor),
               title: Text('Dark Mode'),               
               trailing: Switch.adaptive(
                 value: appTheme.darkTheme, 
                 onChanged: (valor)=> appTheme.darkTheme = valor,
                 activeColor: Provider.of<ThemeChanger>(context).currentTheme.accentColor,
              ),
             ),
             ListTile(
               leading: Icon(Icons.lightbulb_outline , color:Provider.of<ThemeChanger>(context).currentTheme.accentColor),
               title: Text('Custom Mode'),
               trailing: Switch.adaptive(
                 value: appTheme.customTheme,
                 onChanged: (valor)=> appTheme.customTheme = valor,
                 activeColor: Colors.blue,
               ),
             ),
          ],
        )  
      ),
    );
  }
}