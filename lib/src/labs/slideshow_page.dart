// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:provider/provider.dart';

// // SvgPicture.asset('assets/svg/slide1.svg')
// class SlideshowPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {    
//     return ChangeNotifierProvider(
//       create: (_) => SliderModel(),
//       child: Scaffold(
//         body: Center(
//          child: Column(
//             children: <Widget>[
//              Expanded(child: _Slides()),
//              _Dots()
//             ],
//         )
//         ),
//       ),
//     );
//   }
// }

// class SliderModel {
// }
      
// class _Slides extends StatefulWidget {
//   @override
//   __SlidesState createState() => __SlidesState();
// }

// class __SlidesState extends State<_Slides> {

//   final pageviewcontroler = new PageController();
//   @override
//   void initState() {    
//     super.initState();
//     pageviewcontroler.addListener((){
//       print('Pagina actual ${pageviewcontroler.page}');
//       Provider.of<SliderModel>(context,listen:false).currentPage = pageviewcontroler.page;
//     });
//   }

//   @override
//   void dispose() {   
//     pageviewcontroler.dispose();
//      super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: PageView(
//         controller: pageviewcontroler,
//         children:<Widget>[
//           _Slide('assets/svg/slide1.svg'),
//           _Slide('assets/svg/slide2.svg'),
//           _Slide('assets/svg/slide3.svg'),         
//         ]        
//       ),
//     );
//   }
// }

// class _Slide extends StatelessWidget {
//  final String svg; 
//  _Slide(this.svg);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       padding: EdgeInsets.all(30),
//       child: SvgPicture.asset(svg),
//     );
//   }
// }

// class _Dots extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 70,      
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            _Dot(0),
//            _Dot(1),
//            _Dot(2),

//          ],
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {  
//   final int index;
//   _Dot(this.index);
//   @override
//   Widget build(BuildContext context) {
//     final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 200),
//       width: 12,
//       height: 12,
//       margin: EdgeInsets.symmetric(horizontal:5),
//       decoration: BoxDecoration(
//         color: (pageViewIndex >= index - 0.5 && pageViewIndex < index +0.5) ? Color.fromRGBO(126, 1, 64, 1.0) : Colors.grey,
//         shape: BoxShape.circle
//       ),
//     );
//   }
// }