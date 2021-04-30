import 'package:flutter/material.dart';

import '../../firma.dart';
import '../../sabitler.dart';

class FirmaKutucuk extends StatelessWidget {
  final Firma firma;
  final Function press;
  const FirmaKutucuk({
    Key key,
    this.firma,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //Sola Hizaladım
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kSabitPadding),
              //height: 180,
              //width: 160,
              decoration: BoxDecoration(
                  color: firma.color, borderRadius: BorderRadius.circular(16)),
              child: Hero(
                tag: '${firma.id}',
                child: Image.asset(firma.resim),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kSabitPadding / 4),
            child: Text(
              firma.baslik,
              style: TextStyle(color: kYaziRengi, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            firma.kategori,
            style: TextStyle(color: kYaziRengiAcik),
          ),
        ],
      ),
    );
  }
}
