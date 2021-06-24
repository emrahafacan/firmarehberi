import 'package:bosna_mahallesi/ekranlar/login/body.dart';
import 'package:bosna_mahallesi/ekranlar/login/kullanici_listele.dart';
import 'package:bosna_mahallesi/firma.dart';
import 'package:flutter/material.dart';

import '../../sabitler.dart';
import 'body.dart';

class DetayEkrani extends StatelessWidget {
  final Firma firma;

  const DetayEkrani({Key key, this.firma}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firma.color,
      appBar: buildAppBar(context),
      body: Body(firma: firma),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: firma.color,
      title: Text('Bosna Mahallesi'),
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginListeEkrani(),
                ),
              );
            }),
        IconButton(
            icon: Icon(Icons.store),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginEkrani(),
                ),
              );
            }),
        SizedBox(width: kSabitPadding / 2),
      ],
    );
  }
}
