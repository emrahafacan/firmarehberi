//import 'dart:html';

import 'package:bosna_mahallesi/ekranlar/firmadetay/detay.dart';
import 'package:bosna_mahallesi/sabitler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../firma.dart';
import 'firma_listele.dart';
import 'kategoriler.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(kSabitPadding / 2),
          child: Text(
            'Firma Rehberi',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Kategoriler(),
        //FirmaKutucuk(), //Kendi Widgetimi Oluşturdum
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSabitPadding),
            child: GridView.builder(
              itemCount: firmalar.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:
                    kSabitPadding, //kutucuklara DİKEYDE padding ver
                crossAxisSpacing:
                    kSabitPadding, //kutucuklara YATAYDA padding ver
                childAspectRatio: 0.75,
              ),
              itemBuilder: (contex, index) => FirmaKutucuk(
                firma: firmalar[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetayEkrani(
                      firma: firmalar[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
