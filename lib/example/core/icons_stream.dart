import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nombreapp/example/view/icon_animation.dart';

class ListaIcons {
  List<Widget> custon = [
    CustomContainer(
        name: FontAwesomeIcons.medium,
        color: Colors.white,
        key: UniqueKey(),
        redScoial: 'medium',
        url: 'https://medium.com/me/lists'),
    CustomContainer(
      name: FontAwesomeIcons.github,
      color: Colors.black,
      key: UniqueKey(),
      redScoial: 'github',
      url:
          'https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=13&ct=1625066420&rver=7.0.6737.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.live.com%2fowa%2f0%2f%3fstate%3d1%26redirectTo%3daHR0cHM6Ly9vdXRsb29rLmxpdmUuY29tL21haWwvMC9pbmJveC8%26nlp%3d1%26RpsCsrfState%3d806552aa-b8c2-0aa4-d679-1707c8aba52d&id=292841&aadredir=1&CBCXT=out&lw=1&fl=dob%2cflname%2cwld&cobrandid=90015',
    ),
    CustomContainer(
        redScoial: 'facebook',
        name: FontAwesomeIcons.facebook,
        color: Colors.blueAccent,
        key: UniqueKey(),
        url: 'https://web.facebook.com/profile.php?id=100067380702142'),
    CustomContainer(
        redScoial: 'twitter',
        name: FontAwesomeIcons.twitter,
        color: Colors.blue,
        key: UniqueKey(),
        url: 'https://twitter.com/JhonRod51273210'),
  ];

  Stream<List<Widget>> get widgetBoton async* {
    for (var i = 0; i < custon.length; i++) {
      await Future.delayed(const Duration(milliseconds: 600));

      yield custon.sublist(0, i + 1);
    }
  }

  String fecha(int monday) {
    switch (monday) {
      case 1:
        return 'Enero';
      case 2:
        return 'Febrero';
      case 3:
        return 'Marzo';
      case 4:
        return 'Abril';
      case 5:
        return 'Mayo';
      case 6:
        return 'Junio';
      case 7:
        return 'Julio';
      case 8:
        return 'Agosto';
      case 9:
        return 'Septiembre';
      case 10:
        return 'Octubre';
      case 11:
        return 'Octubre';
      case 12:
        return 'Diciembre';

      default:
        return 'Fecha';
    }
  }

  String fechaCompleta(Timestamp data) {
    int datames =
        DateTime.fromMicrosecondsSinceEpoch(data.microsecondsSinceEpoch)
            .toLocal()
            .month;
    String mes = fecha(datames);
    int day = DateTime.fromMicrosecondsSinceEpoch(data.microsecondsSinceEpoch)
        .toLocal()
        .day;
    int year = DateTime.fromMicrosecondsSinceEpoch(data.microsecondsSinceEpoch)
        .toLocal()
        .year;
    String fechaaprseada = '$mes $day, $year';
    return fechaaprseada;
  }
}
