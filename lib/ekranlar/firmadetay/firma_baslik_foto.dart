import 'package:flutter/material.dart';

import '../../firma.dart';
import '../../sabitler.dart';

class FirmaBaslikFoto extends StatelessWidget {
  const FirmaBaslikFoto({
    Key key,
    @required this.firma,
  }) : super(key: key);

  final Firma firma;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kSabitPadding,
        vertical: kSabitPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            firma.kategori,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            firma.baslik,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          //SizedBox(height: kSabitPadding), //telefona göre burayı oynayabilirsin
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Telefon\n',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text:
                          '0332 332 32 32', //Buraya firmanın telefon numarası gelecek
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kSabitPadding),
              Expanded(
                child: Hero(
                  tag: '${firma.id}',
                  child: Image.asset(
                    firma.resim,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
