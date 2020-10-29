import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


 class MenuButtons{
   final Function onPressed;
   final IconData icon;
   MenuButtons({this.onPressed, this.icon});
 }

 class MenuPint extends StatelessWidget {

   final bool mostrar;
   final Color backgroundColor;
   final Color activeColor;
   final Color inactiveColor;
  final List<MenuButtons> items;

  MenuPint({
     this.mostrar = true,
     this.backgroundColor = Colors.white,
     this.activeColor = Colors.black,
     this.inactiveColor = Colors.blueGrey,
     @required this.items

  });

  //  final List<MenuButtons> items = [
  //     MenuButtons(icon: Icons.dashboard ,onPressed: (){print('1');} ),
  //     MenuButtons(icon: Icons.face,onPressed: (){print('2');} ),
  //     MenuButtons(icon: Icons.search,onPressed: (){print('3');} ),
  //     MenuButtons(icon: Icons.security,onPressed: (){print('4');} ),
  //  ];
   @override
   Widget build(BuildContext context) {  
        
     return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds:250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context){
             Provider.of<_MenuModel>(context,listen: false).backgrounColor = this.backgroundColor;
             Provider.of<_MenuModel>(context,listen: false).activeColor = this.activeColor;
             Provider.of<_MenuModel>(context,listen: false).inactiveColor= this.inactiveColor;
            return _BackgroundMenu(
              child: _MenuItems(items),          
            );
          }          
        ),
      ),
     );
   }
 }

class _BackgroundMenu extends StatelessWidget {  
  final Widget child; 

  _BackgroundMenu({
    @required this.child,
    
  });  
  @override
  Widget build(BuildContext context) {  
      
    final backgroundColor = Provider.of<_MenuModel>(context).backgrounColor;  
    
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            offset: Offset(5,10),
            blurRadius: 10,
            spreadRadius: -5, 
          )
        ]
      ),
      
    );
  }
}

 class _MenuItems extends StatelessWidget {


   
    //  Provider.of<_MenuModel>(context,listen: false)._backgrounColor = this.backgroundColor;

  final List<MenuButtons> menuitems;
  _MenuItems(this.menuitems);
   @override
   Widget build(BuildContext context) {
     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: List.generate(menuitems.length, (i)=> _ItemButton( i ,menuitems[i]) )
     );
   }
 }

 class _ItemButton extends StatelessWidget {

   final int index;
   final MenuButtons item;

  _ItemButton(this.index,this.item);
   @override
   Widget build(BuildContext context) {
     final itemseleccionado = Provider.of<_MenuModel>(context).itemSeleccionado; 
     final activate = Provider.of<_MenuModel>(context).activeColor;    
     final desactivate = Provider.of<_MenuModel>(context).inactiveColor;       
      
     return GestureDetector(
       onTap: (){
         Provider.of<_MenuModel>(context,listen: false).itemSeleccionado = index;
         item.onPressed();
       },
        child: Container(                    
          child: Icon(
            item.icon,
            size: (itemseleccionado == index) ? 35: 25,
            color: (itemseleccionado == index) ? activate: desactivate
          ),     
       ),
     );
   }
 }

 class _MenuModel extends ChangeNotifier {

  //  final Color backgroundColor;
  //  final Color activeColor;
  //  final Color inactiveColor;
  int _itemSeleccionado=0;
  Color backgrounColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

   int get itemSeleccionado => this._itemSeleccionado;

   set itemSeleccionado (int index){
     this._itemSeleccionado = index;
     notifyListeners();
   }

  // Color get backgrounColor => this._backgrounColor;
  // set backgrounColor (Color background){
  //   this._backgrounColor = background;
  //   notifyListeners();
  // }

  // Color get activeColor => this._activeColor;
  // set activeColor (Color activeColor){
  //   this._activeColor = activeColor;
  //   notifyListeners();
  // }

  // Color get inactiveColor => this._inactiveColor;
  // set inactiveColor (Color inactiveColor){
  //   this._inactiveColor = inactiveColor;
  //   notifyListeners();
  // }

 }

 