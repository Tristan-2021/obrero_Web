import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nombreapp/example/utils/colors.dart';
import 'package:nombreapp/example/view/examples.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';


import '../core/responsive/responsive.dart';
import '../utils/style_text_font.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final _firebaseFirestore = FirebaseFirestore.instance.collection('data');

  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionListener =
      ItemPositionsListener.create();
  @override
  void initState() {
    super.initState();

    _itemPositionListener.itemPositions.addListener(() {});
  }
 bool colorbarra = false;
  Widget selecte(
    index,
    size,
  ) {
    switch (index) {
      case 0:
        return SizedBox(
            height: size.width <= 300 ? 650 : 800,
            child: PageExample1(
              onTap: () => selecwidget(index),
              size: size,
            ));
      case 1:
        return SizedBox(
            height: size.width <= 300 ? 600 : 900,
            child: PageExample2(
              onTap: () => selecwidget(index),
              size: size,
            ));
      case 2:
        return SizedBox(
          height: size.width <= 300 ? 650 : 800,
        );

      default:
    }
    return const Text('vacio');
  }

  selecwidget(int index) {
    setState(() {});
    if (_itemScrollController.isAttached && index == 0) {
      _itemScrollController.scrollTo(
          index: index, duration: const Duration(seconds: 1));
    } else if (_itemScrollController.isAttached && index == 1) {
      _itemScrollController.scrollTo(
          index: index, duration: const Duration(seconds: 1));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return  LayoutBuilder(builder: (context, constrains) {

    ResponsiveUi.init(constrains);
    log('${ResponsiveUi.textcontraints *15} ');
    return Scaffold( 
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
            elevation: 1.3,
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            leading: (  ResponsiveUi.textcontraints *15 <= 87) ? const Icon(Icons.menu) : null, 
          actions:!(  ResponsiveUi.textcontraints *15 <= 87) ?    
  [ 
                TextButton(
                onPressed: () => selecwidget(0),
                child: Text(
                  'Home',
                  style: GoogleFonts.exo2(
                                              color: const Color.fromARGB(255, 242, 248, 247),

                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.0),
                ),
              ),
const    Spacer(),
           
                 TextButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(  
                  (Set<MaterialState> state) {
                  if(!state.contains(MaterialState.pressed)){
                    return colorsbackground;
                  } 
                    return colorsbackground1;
                  
              
                }) 
                ),
                onPressed: () => selecwidget(1),
                child: Text(
                  'Proyectos',
                  style: GoogleFonts.exo2(
                                     color: const Color.fromARGB(255, 242, 248, 247),
              
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.0),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              TextButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(  
                  (Set<MaterialState> state) {
                  if(!state.contains(MaterialState.pressed)){
                    return colorsbackground;
                  } 
                    return colorsbackground1;
                  
              
                }) 
                ),
                onPressed: () async=> selecwidget(1),
                child: Text(
                  'Artículos',
                  style: GoogleFonts.exo2(
                                     color: const Color.fromARGB(255, 242, 248, 247),
              
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.0),
                ),
              ),
                const SizedBox(
                width: 15,
              ),
                     TextButton(
                onPressed: () => selecwidget(0),
                child: Text(
                  'Acerde De',
                  style: GoogleFonts.exo2(
                                              color: const Color.fromARGB(255, 242, 248, 247),

                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0),
                ),
              ),
               const SizedBox(
                width: 20,
              ),
             const VerticalDivider(
               indent: 15.0,
               width: 1.0,
               endIndent: 15.0,
               color: Color.fromARGB(255, 57, 66, 64), thickness: 1.0),
                   TextButton(
                onPressed: () async=> await launchUrl(Uri.file('https://github.com/Tristan-2021/') ) ,
                child: const  Icon(FontAwesomeIcons.github, color: Colors.white,),
              ),
              const SizedBox(
                width: 10,
              ),
            ] : null  ),
        body: SafeArea(
            child: Center(
                child: ScrollablePositionedList.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemPositionsListener: _itemPositionListener,
                    itemScrollController: _itemScrollController,
                    itemBuilder: (_, index) {
                      return selecte(index, size);
                    }))));
  
  }) ; }
}
