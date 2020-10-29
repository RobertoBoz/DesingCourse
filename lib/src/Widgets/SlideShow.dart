import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool top;
  final Color primaricolor;
  final Color secundarycolor;
  final double primarybuler;
  final double secundarybuler;

  Slideshow({
    @required this.slides,
    this.top = false,
    this.primaricolor ,
    this.secundarycolor ,
    this.primarybuler = 12,
    this.secundarybuler = 12
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      child: SafeArea(
      child: Center(
          child: Builder(
            builder: (BuildContext context){
              Provider.of<_SliderModel>(context)._primaricolor = this.primaricolor;
              Provider.of<_SliderModel>(context)._secundarycolor = this.secundarycolor;
              Provider.of<_SliderModel>(context)._primarybuler = this.primarybuler;
              Provider.of<_SliderModel>(context)._secundarybuler = this.secundarybuler;
              return StructureSlideShow(top: top, slides: slides);
            }
          ),
        ),
       ),
    );
  }
}

class StructureSlideShow extends StatelessWidget {
  const StructureSlideShow({
    Key key,
    @required this.top,
    @required this.slides,
  }) : super(key: key);

  final bool top;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if(this.top) _Dots(this.slides.length,),
        Expanded(child: _Slides(this.slides)),
        if(!this.top) _Dots(this.slides.length,),
      ],
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;
  _Slides(this.slides);
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageviewcontroler = new PageController();
  @override
  void initState() {    
    super.initState();
    pageviewcontroler.addListener((){      
      Provider.of<_SliderModel>(context,listen:false).currentPage = pageviewcontroler.page;
    });
  }

  @override
  void dispose() {   
    pageviewcontroler.dispose();
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageviewcontroler,
        // children:<Widget>[
        //   _Slide('assets/svg/slide1.svg'),
        //   _Slide('assets/svg/slide2.svg'),
        //   _Slide('assets/svg/slide3.svg'),         
        // ] 
        children: widget.slides.map((child) => _Slide(child)).toList(),   
      ),
    );
  }
}

class _Slide extends StatelessWidget {
 
 final Widget slide;
 _Slide(this.slide);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  
  final int slideleng;
 

  _Dots(this.slideleng,);

  @override
  Widget build(BuildContext context) {
    // final _size = MediaQuery.of(context).size;  
    return Container(
      width: double.infinity,
      height: 70,   
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.slideleng, (i) => _Dot(i)),
      ), 
      // margin: EdgeInsets.only(left:_size.width * 0.35 ),  
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount:  slideleng,
      //   itemBuilder: (BuildContext context, int index){
      //     return _Dot(index);
      //   } 
      // )     
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;  
  _Dot(this.index,);

  @override
  Widget build(BuildContext context) {

    final ssModel = Provider.of<_SliderModel>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index +0.5)? ssModel._primarybuler : ssModel.secondarybuler,
      height: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index +0.5)? ssModel._primarybuler : ssModel.secondarybuler,
      margin: EdgeInsets.symmetric(horizontal:5),
      decoration: BoxDecoration(
        color: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index +0.5) ? ssModel.colorprimary : ssModel.colorsecundary,
        shape: BoxShape.circle
      ),
    );
  }
}

class _SliderModel extends ChangeNotifier{  

  double _currentPage = 0;
  Color _primaricolor = Colors.blue;
  Color _secundarycolor = Colors.grey;
  double _primarybuler = 12.0;
  double _secundarybuler = 12.0;

  double get currentPage => this._currentPage;
  set currentPage( double currentPage){
    this._currentPage = currentPage;
    notifyListeners();
  }
  //Colorprimario
  Color get colorprimary =>this._primaricolor;
  set colorprimary (Color primary){
    this._primaricolor = primary;
    
  }
  //Secundario
  Color get colorsecundary =>this._secundarycolor;
  set colorsecundary (Color secondary){
    this._secundarycolor = secondary;
    
  }

  double get primarybuler => this._primarybuler;
  set primarybuler( double primary){
    this._primarybuler = primary;
    
  }

  double get secondarybuler => this._secundarybuler;
  set secondarybuler( double secondary){
    this._secundarybuler = secondary;    
  }


}