import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projet/pages/driver.dart';

int id_c = 2;

class commandeDr extends StatelessWidget {
  final int id_entreprise;
  final String Nom_ent;
  // final String id_categorie;
  final String photo;
  final String username;
  final String pwd;
  commandeDr(
      {required this.id_entreprise,
      required this.Nom_ent,
      // required this.id_categorie,
      required this.photo,
      required this.username,
      required this.pwd});

  TextEditingController delai = TextEditingController();

  Future upload() async {
    final uri = Uri.parse("http://192.168.56.1/Service_app/upload.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['Nom_commande'] = 'Driver';
    request.fields['username'] = '$username';
    request.fields['delai'] = delai.text;
    request.fields['id_entreprise'] = '$id_entreprise';
    request.fields['prix'] = '5000';

    var response = await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
                width: 400,
                height: 200,
                child: ListTile(
                  title: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade100),
                      child: Image.network(
                          "http://192.168.56.1/Service_app/photos/${photo}")),
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              Nom_ent,
              style: TextStyle(
                fontSize: 35,
                color: Colors.purple.shade900,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: delai,
                  decoration: InputDecoration(
                    labelText: 'delai',
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            MaterialButton(
              onPressed: () {
                upload();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DriverPage(
                              username: username,
                              pwd: '',
                            )));
              },
              child: Text(
                "Commander Maintenant",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              color: Colors.blue,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
