import 'package:bosna_mahallesi/ekranlar/giris/body.dart';
import 'package:bosna_mahallesi/sabitler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class GirisEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          'Bosna Mahallesi',
          style: TextStyle(
            fontFamily: 'Satisfy',
            fontSize: 25,
          ),
        ),
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple, Colors.red],
        ),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Uygulama Hakkında'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(
                            'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 203311103 numaralı Emrah AFACAN tarafından 30 Nisan 2021 günü yapılmıştır.'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Kapat'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.store), onPressed: () {}),
          SizedBox(width: kSabitPadding / 2),
        ],
      ),
      body: Body(),
    );
  }
}
