import 'package:bosna_mahallesi/sabitler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../firma.dart';
import 'firma_baslik_foto.dart';

class Body extends StatelessWidget {
  final Firma firma;

  const Body({Key key, this.firma}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //toplam yükseklik ve genişlik bilgisi verir
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kSabitPadding,
                    right: kSabitPadding,
                  ),
                  //height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Puanla'),
                                Row(
                                  children: [
                                    Puanla(
                                      color: firma.color,
                                      puan: true,
                                    ),
                                    Puanla(
                                      color: firma.color,
                                      puan: true,
                                    ),
                                    Puanla(
                                      color: firma.color,
                                      puan: true,
                                    ),
                                    Puanla(color: firma.color),
                                    Puanla(color: firma.color),
                                    //Slider(
                                    //min: 0,
                                    //max: 10,
                                    //value: 3.0,
                                    //)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          new GestureDetector(
                            child: new Text(
                              'Yorum Yap',
                              style: TextStyle(
                                color: firma.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onDoubleTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                new SnackBar(
                                  content: new Text('Çift Tıkladın!'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.blue,
                          child: new GestureDetector(
                            child: new Text('Çift Tıkla'),
                            onTapUp: (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                new SnackBar(
                                  content:
                                      new Text(e.toString() + ' Tetik Var!'),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: kSabitPadding),
                        child: Text(
                          firma.aciklama,
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            color: firma.color,
                            onPressed: () {},
                            child: Text(
                              'Hemen Ara'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                FirmaBaslikFoto(firma: firma)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Puanla extends StatelessWidget {
  final Color color;
  final bool puan;
  const Puanla({
    Key key,
    this.color,
    this.puan = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kSabitPadding / 4, right: kSabitPadding / 2),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: puan ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
