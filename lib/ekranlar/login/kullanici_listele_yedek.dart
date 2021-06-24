import 'package:bosna_mahallesi/ekranlar/login/body.dart';
import 'package:bosna_mahallesi/models/uyeler.dart';
import 'package:bosna_mahallesi/services/db_utils.dart';
import 'package:flutter/material.dart';

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
      appBar:
          AppBar(title: Text(uyeList.length.toString() + " Uye listelendi")),
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
                    title: Text(uyeList[index].eposta),
                    onTap: () {
                      showAlert("Uye " + index.toString() + " tiklandi",
                          "Uye " + uyeList[index].eposta + " tikla");
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
