import 'package:flutter/material.dart';

import '../../sabitler.dart';

class Kategoriler extends StatefulWidget {
  @override
  _KategorilerState createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
  List<String> kategoriler = [
    'Bilişim',
    'Emlak',
    'Alışveriş',
    'Restoran',
    'Kafe',
    'Market',
    'Taksi',
    'Oto Yıkama',
  ];
  int kategoriIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSabitPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kategoriler.length,
          itemBuilder: (context, index) => buildKategori(index),
        ),
      ),
    );
  }

//KENDİ Widget'imi OLUŞTURDUM
  Widget buildKategori(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          kategoriIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSabitPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kategoriler[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kategoriIndex == index ? kYaziRengi : kYaziRengiAcik,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.0),
              height: 2,
              width: 30,
              color: kategoriIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
