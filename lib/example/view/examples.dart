import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nombreapp/example/core/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../cubit/blog_cubit.dart';
import '../utils/icons_stream.dart';
import '../utils/style_text_font.dart';


class PageExample1 extends StatelessWidget {
  final VoidCallback onTap;
  final Size size;
  const PageExample1({Key? key, required this.onTap, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListaIcons stream = ListaIcons();
    return LayoutBuilder(builder: (context, constrains) {
      ResponsiveUi.init(constrains);

      return Scaffold(
        backgroundColor: colorazulospocooscuro,
        body: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: constrains.maxWidth <= 830 ? 50.0 : 170.0,
              left: constrains.maxWidth <= 600
                  ? ResponsiveUi.textcontraints * 2.5
                  : ResponsiveUi.textcontraints * 0.5,
              height: constrains.maxWidth <= 830 ? 75.0 : 400,
              width: constrains.maxWidth <= 830 ? 400 : 150,
              child: StreamBuilder<List<Widget>>(
                  key: UniqueKey(),
                  stream: stream.widgetBoton,
                  builder: (context, AsyncSnapshot<List<Widget>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("...."),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: constrains.maxWidth <= 830
                          ? Axis.horizontal
                          : Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Container(
                        margin: constrains.maxWidth <= 869
                            ? const EdgeInsets.all(5.0)
                            : const EdgeInsets.all(10.0),
                        child: snapshot.data![index],
                      ),
                    );
                  }),
            ),
            Positioned(
              top: constrains.maxWidth <= 869 ? 160.0 : 70,
              left: constrains.maxWidth <= 930
                  ? ResponsiveUi.textcontraints * 9.0
                  : ResponsiveUi.textcontraints * 17.0,
              child: SizedBox(
                child: Text(
                  bienvenidos,
                  textScaleFactor: ResponsiveUi.textHeith * 0.14,
                  style: GoogleFonts.lato(
                      color: const Color(0xffD0F1EF),
                      // fontSize: ResponsiveUi.textHeith * 2.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2.0),
                ),
              ),
            ),
            Positioned(
              top: constrains.maxWidth <= 869 ? 210.0 : 140,
              left: constrains.maxWidth <= 930
                  ? ResponsiveUi.textcontraints * 9.0
                  : ResponsiveUi.textcontraints * 17.0,
              child: SizedBox(
                child: Text(
                  constrains.maxWidth <= 930
                      ? titulosiguiente1web
                      : titulogrande,
                  style: GoogleFonts.lato(
                      color: const Color(0xffD0F1EF),
                      fontSize: ResponsiveUi.textHeith * 3.3,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0),
                ),
              ),
            ),
            Positioned(
              top: constrains.maxWidth <= 830 ? 340 : 430,
              left: constrains.maxWidth <= 930
                  ? ResponsiveUi.textcontraints * 9.0
                  : ResponsiveUi.textcontraints * 17.0,
              child: Text(
                titulosiguiente,
                style: GoogleFonts.lato(
                    color: const Color(0xffD0F1EF),
                    fontSize: constrains.maxWidth <= 869 ? 13 : 18,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2.0),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class PageExample2 extends StatelessWidget {
  final VoidCallback onTap;
  final Size size;

  const PageExample2({Key? key, required this.onTap, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListaIcons _listaIcons = ListaIcons();
    return Scaffold(
      backgroundColor: colorazulospocooscuro,
      body: Center(
          child: SizedBox(
        width: size.width <= 500 ? 350 : 1000,
        child: Column(
          children: [
            Text(
              'Artículos',
              style: tituloblog,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: BlocBuilder<BlogCubit, BlogState>(
                builder: (context, state) {
                  if (state is BlogInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is BlogLoaded) {
                    var blog = state.blog;
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10.0,
                            childAspectRatio: size.width <= 500 ? 2 : 3,
                            crossAxisCount: size.width <= 500 ? 1 : 3,
                            mainAxisExtent: size.width <= 500 ? 250.0 : 350.0),
                        itemCount: blog.length,
                        itemBuilder: (_, index) {
                          String dateTimefecha =
                              _listaIcons.fechaCompleta(blog[index].timesData);

                          return GestureDetector(
                            onTap: () => _launchURLBrowser(blog[index].post)
                            ,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffD0F1EF),
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: const EdgeInsets.all(25.0),
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image:  DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  blog[index].imglink )),
                                          color: colormenta,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft:
                                                  Radius.circular(10.0))),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        dateTimefecha,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w100,
                                            color: colorazulospocooscuro),
                                      ),
                                      const Expanded(
                                        child: SizedBox(
                                          height: 2.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    blog[index].titulo,
                                    textAlign: TextAlign.justify,
                                    style: letrarticulos,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else if (state is BlogError) {
                    return Center(
                      child: Text(state.error),
                    );
                  }
                  return const Center(
                    child: Text('error'),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
   _launchURLBrowser(String link) async {
  final url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}
