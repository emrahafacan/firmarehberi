import 'package:bosna_mahallesi/ekranlar/login/body.dart';
import 'package:bosna_mahallesi/models/uyeler.dart';
import 'package:bosna_mahallesi/services/db_utils.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

DbUtils utils = DbUtils();

class LoginListeEkrani extends StatefulWidget {
  @override
  _LoginListeEkraniState createState() => _LoginListeEkraniState();
}

class _LoginListeEkraniState extends State<LoginListeEkrani> {
  List<Uyeler> uyeList = [];

  void getData() async {
    await utils.uyeler().then((result) => {
          setState(() {
            uyeList = result;
          })
        });
    print(uyeList);
  }

  void showAlert(String alertTitle, String alertContent) {
    AlertDialog alertDialog;
    alertDialog =
        AlertDialog(title: Text(alertTitle), content: Text(alertContent));
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(uyeList.length.toString() + " Uye listelendi"),
        gradient: LinearGradient(
          colors: [Colors.pink[900], Colors.pink[700], Colors.pink[400]],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: uyeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.pink,
                      size: 46.0,
                    ),
                    title: Text(uyeList[index].eposta),
                    subtitle: Text('Uzun basarak silebilirsiniz'),
                    trailing: Icon(
                      Icons.list,
                      color: Colors.teal,
                      size: 24.0,
                    ),
                    onTap: () {
                      String oneAsString = uyeList[index].id.toString();
                      showAlert("Uye ID : " + oneAsString + " tıklandı!",
                          uyeList[index].eposta);
                    },
                    onLongPress: () async {
                      await utils
                          .deleteUyeler(uyeList[index].id)
                          .then((value) => {
                                showAlert(
                                    "Uye " + index.toString() + " silindi",
                                    "Uye " + index.toString() + " sil")
                              });
                      getData();
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginEkrani()),
                    );
                  },
                  child: Text("Anasayfaya Don")),
            ),
          ],
        ),
      ),
    );
  }
}
