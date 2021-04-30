import 'package:bosna_mahallesi/ekranlar/giris/giris.dart';
import 'package:bosna_mahallesi/sabitler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kYaziRengi),
        primarySwatch: Colors.blue,
      ),
      home: GirisEkrani(),
    );
  }
}
