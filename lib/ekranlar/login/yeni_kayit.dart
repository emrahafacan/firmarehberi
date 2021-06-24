import 'package:bosna_mahallesi/models/uyeler.dart';
import 'package:bosna_mahallesi/sabitler.dart';
import 'package:bosna_mahallesi/services/db_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:sqflite/sqflite.dart';

import 'body.dart';

DbUtils utils = DbUtils();

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
      home: LoginKayitEkrani(),
    );
  }
}

class LoginKayitEkrani extends StatefulWidget {
  @override
  _LoginKayitEkraniState createState() => _LoginKayitEkraniState();
}

class _LoginKayitEkraniState extends State<LoginKayitEkrani> {
  TextEditingController uyeIdController = TextEditingController();
  TextEditingController uyeFirmaKoduController = TextEditingController();
  TextEditingController uyeEpostaController = TextEditingController();
  TextEditingController uyeSifreController = TextEditingController();

  Future<Database> database;

  List<Uyeler> uyeList = [];

  _onPressedUpdate() async {
    final uyeal = Uyeler(
      id: int.parse(uyeIdController.text),
      firmakodu: uyeFirmaKoduController.text,
      eposta: uyeEpostaController.text,
      sifre: uyeSifreController.text,
    );
    utils.updateUyeler(uyeal);
    uyeList = await utils.uyeler();
    //print(uyeList);
    getData();
  }

  _onPressedAdd() async {
    final uyeal = Uyeler(
      id: int.parse(uyeIdController.text),
      firmakodu: uyeFirmaKoduController.text,
      eposta: uyeEpostaController.text,
      sifre: uyeSifreController.text,
    );
    utils.insertUyeler(uyeal);
    uyeList = await utils.uyeler();
    print(uyeList);
    getData();
  }

  _deleteUyeTable() {
    utils.deleteTable();
    uyeList = [];
    getData();
  }

  void getData() async {
    await utils.uyeler().then((result) => {
          setState(() {
            uyeList = result;
          })
        });
    print(uyeList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          'Yeni Kullanıcı',
          style: TextStyle(
            fontFamily: 'Satisfy',
            fontSize: 25,
          ),
        ),
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.deepOrange, Colors.amber],
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
              child: Hero(
                tag: 'Kullanıcı Girişi',
                child: Image.asset(
                  "assets/images/user_foto.png",
                  //fit: BoxFit.fill,
                ),
              ),
            ),
            Text('Firma ID'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: uyeIdController,
                decoration: const InputDecoration(
                  hintText: 'Firma ID giriniz',
                ),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
              ),
            ),
            Text('Firma Kodu'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: uyeFirmaKoduController,
                decoration: const InputDecoration(
                  hintText: 'Firma kodunuzu giriniz',
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
                controller: uyeEpostaController,
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
                controller: uyeSifreController,
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
              child: ElevatedButton(
                onPressed: _onPressedAdd,
                child: const Text('Yeni Kayıt Yap'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
