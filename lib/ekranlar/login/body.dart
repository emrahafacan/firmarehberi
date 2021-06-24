import 'package:bosna_mahallesi/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import 'grafik.dart';
import 'yeni_kayit.dart';

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
      home: LoginEkrani(),
    );
  }
}

class LoginEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          'Kullanıcı Girisi',
          style: TextStyle(
            fontFamily: 'Satisfy',
            fontSize: 25,
          ),
        ),
        gradient: LinearGradient(
          colors: [Colors.red, Colors.purple, Colors.lightBlueAccent],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: InteractiveViewer(
                minScale: 0.2,
                maxScale: 100.2,
                child: Image.asset(
                  "assets/images/bosna_logo.png",
                  //width: 200,
                  //height: 200,
                  //fit: BoxFit.fill,
                ),
              ),
            ),
            Text('Firma Kodu'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Sisteme kayıtlı firma kodunuzu giriniz',
                ),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
              ),
            ),
            Text('E-Posta'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'E-Posta giriniz',
                ),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
              ),
            ),
            Text('Şifre'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Şifrenizi giriniz',
                ),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginKayitEkrani(),
                        ),
                      );
                    },
                    child: const Text('Kayıt Ol'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Giriş Yap'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BarChartSample1(),
                        ),
                      );
                    },
                    child: const Text('İstatistikler'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
