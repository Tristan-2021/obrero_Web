import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nombreapp/example/view/examples.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            actions: [
              const SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () => selecwidget(0),
                child: Text(
                  'Acerca de',
                  style: GoogleFonts.actor(
                      color: const Color(0xffD0F1EF),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () => selecwidget(1),
                child: Text(
                  'Artículos',
                  style: GoogleFonts.lato(
                      color: const Color(0xffD0F1EF),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
            ]),
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
  }
}
