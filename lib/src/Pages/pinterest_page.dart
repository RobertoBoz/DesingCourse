import 'package:curso/src/Widgets/menu_personmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (_)=> new _MenuModel(),
      child: Scaffold(
        body: Stack(
          children:<Widget>[
            PinteresGread(),
            _LocationMenu()
          ]
          ),
        
      ),
    );
  }
}

class _LocationMenu extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final widthpantalla = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 30,
      width: widthpantalla,
      child: Align(
        child: MenuPint(
          mostrar: mostrar ,
          // backgroundColor: Colors.amber,
          // activeColor: Colors.blue,
          // inactiveColor: Colors.red,
          items: [
            MenuButtons(icon: Icons.dashboard ,onPressed: (){print('1');} ),
            MenuButtons(icon: Icons.face,onPressed: (){print('2');} ),
            MenuButtons(icon: Icons.search,onPressed: (){print('3');} ),
            MenuButtons(icon: Icons.security,onPressed: (){print('4');} ),
            MenuButtons(icon: Icons.security,onPressed: (){print('4');} ),
          ],
        ))
    );
  }
}


class PinteresGread extends StatefulWidget {
  @override
  _PinteresGreadState createState() => _PinteresGreadState();
}

class _PinteresGreadState extends State<PinteresGread> {
  final List<int> items = List.generate(200, (i)=> i);
  ScrollController controller = new ScrollController();
  double scrollatecesor =0;
  @override
  void initState() {
    controller.addListener((){     
      if(controller.offset > scrollatecesor && controller.offset > 150){
        Provider.of<_MenuModel>(context,listen: false).mostrar = false;
      }else{
        Provider.of<_MenuModel>(context,listen: false).mostrar = true;
      }
      scrollatecesor = controller.offset;
      // print('Scrollistener ${controller.offset}');
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      physics: BouncingScrollPhysics(),
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;
  _PinterestItem(this.index);
  
  @override
  Widget build(BuildContext context) {
    return new Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.all(Radius.circular(35))
    ),
    
    child: new Center(
      child: new CircleAvatar(
        backgroundColor: Colors.white,
        child: new Text('$index'),
      ),
    ));
  }
}

class _MenuModel extends ChangeNotifier{
   bool _mostrar = true;
   bool get mostrar => this._mostrar;

   set mostrar(bool valor){
     this._mostrar = valor;
     notifyListeners();
   }
}