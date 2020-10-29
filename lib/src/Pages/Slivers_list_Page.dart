import 'package:animate_do/animate_do.dart';
import 'package:curso/src/Widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SliverPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Stack(
        children: <Widget>[
          MainScroll(),
          Positioned(
            bottom: -10,
            right: -10,
            child: BotonNew()
          )
        ],
      ) ,
      // body: _ListTareas(),
      // body: IconHeader(
      //   icon:  FontAwesomeIcons.windows,
      //   title: 'Windows',
      //   subtitle: 'Example 123',
      // ),
   );
  }
}


class MainScroll extends StatelessWidget {

    final items = [
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Orange', Color(0xffF08F66) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Family', Color(0xffF2A38A) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Subscriptions', Color(0xffF7CDD5) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Books', Color(0xffFCEBAF) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Orange', Color(0xffF08F66) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Family', Color(0xffF2A38A) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Subscriptions', Color(0xffF7CDD5) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Books', Color(0xffFCEBAF) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Orange', Color(0xffF08F66) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Family', Color(0xffF2A38A) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Subscriptions', Color(0xffF7CDD5) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Books', Color(0xffFCEBAF) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Orange', Color(0xffF08F66) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Family', Color(0xffF2A38A) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Subscriptions', Color(0xffF7CDD5) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Books', Color(0xffFCEBAF) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Orange', Color(0xffF08F66) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Family', Color(0xffF2A38A) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Subscriptions', Color(0xffF7CDD5) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Books', Color(0xffFCEBAF) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Orange', Color(0xffF08F66) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Family', Color(0xffF2A38A) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Subscriptions', Color(0xffF7CDD5) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Books', Color(0xffFCEBAF) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Orange', Color(0xffF08F66) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Family', Color(0xffF2A38A) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Subscriptions', Color(0xffF7CDD5) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Books', Color(0xffFCEBAF) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Orange', Color(0xffF08F66) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Family', Color(0xffF2A38A) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Subscriptions', Color(0xffF7CDD5) )),
    FadeInLeft( duration: Duration(milliseconds: 250),child: _ItemList( 'Books', Color(0xffFCEBAF) )),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView( 
      physics: BouncingScrollPhysics(),
      slivers:<Widget>[
        SliverPersistentHeader(
          floating:  true,          
          delegate: _SliverCustomDelegateHeader(            
            minheight: 280,
            maxheight: 300,
            child:  IconHeader(
              icon:  FontAwesomeIcons.circle,
              title: 'Windows',
              subtitle: 'Example 123',
              colorgradient1: Color.fromRGBO(238, 132, 91, 1),
              colorgradient2: Color.fromRGBO(251, 231, 164, 1),
            )
           
          )
        ),
        SliverList(
          
          delegate: SliverChildListDelegate(
            items
          )
        )
      ]      
    );
  }
}

class _SliverCustomDelegateHeader extends SliverPersistentHeaderDelegate{

  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomDelegateHeader({@required this.minheight, @required this.maxheight,  @required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
  
    return SizedBox.expand(child:child);
  }

  @override
  
  double get maxExtent => (minheight > maxheight) ? minheight: maxheight;

  @override
 
  double get minExtent => (minheight < maxheight) ? minheight: maxheight;

  @override
  bool shouldRebuild(_SliverCustomDelegateHeader oldDelegate) {
 
    return maxheight != oldDelegate.maxheight ||
           minheight != oldDelegate.minheight ||
           child != oldDelegate.child;
  }
}

class _ItemList extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ItemList(this.titulo, this.color) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: EdgeInsets.only(left:50),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Text('asdasda',style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),),
    );
  }
}

class BotonNew extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(     
      minWidth: size.width * 0.9,
      height: size.height * 0.13,
      child: RaisedButton(
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only( topLeft: Radius.circular(50))
        ),
        onPressed: () {  },  
        child: Text(
          'Create New List',
          style: TextStyle(
            color:Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3            
          ),
        ),      
      )

    );
  }
}
// class _ListTareas extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: BouncingScrollPhysics(),
//       itemCount: 20,
//       itemBuilder: (BuildContext context, int index)=> ItemList()
//     );
//   }
// }