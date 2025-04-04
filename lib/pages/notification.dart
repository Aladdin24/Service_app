import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projet/animation/FadeAnimation.dart';
import 'package:projet/demande/commande.dart';
import 'package:projet/login/login.dart';
import 'package:projet/login/select_service.dart';

class notification extends StatefulWidget {
  // final int id_entreprise;
  // final String Nom_ent;
  final String username;
  final String pwd;
  // final DateTime tgl;

  notification({
    required this.username,
    required this.pwd,
    // required this.id_entreprise,
    // required this.Nom_ent,
    // required this.tgl
  });
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  // where() async {
  //   final rsp = await http.post(
  //       Uri.parse("http://192.168.43.245/Service_app/viewCmd.php"),
  //       body: {
  //         "username": username,
  //       });
  // }

  Future cmduser() async {
    var url = "http://192.168.56.1/Service_app/viewCmd.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": username,
    });

    var jsonData = json.decode(response.body);

    List<Commande> commandes = [];

    for (var v in jsonData) {
      Commande commande = Commande(
        int.parse(v["id_commande"]),
        v["Nom_commande"],
        v["image"],
        v["delai"],
        v["etat_cmd"],
      );

      commandes.add(commande);
    }
    print(commandes.length);

    return commandes;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          iconTheme: IconThemeData(),
          title: Row(
            children: [
              Text("$username",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  )),
            ],
          ),
          backgroundColor: Colors.white),
      body: RefreshIndicator(
        color: Colors.blue,
        onRefresh: () {
          return Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (a, b, c) => notification(
                        username: username,
                        pwd: '',
                      )));
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder(
            future: cmduser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int id) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Demande :   ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data[id].Nom_commande,
                                    style: TextStyle(
                                      color: Colors.blue.shade500,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Date          :  ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data[id].delai,
                                    style: TextStyle(
                                      color: Colors.blue.shade500,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   height: 10.0,
                              // ),
                              // Text(
                              //   "Votre probleme",
                              //   style: TextStyle(
                              //     color: Colors.black,
                              //     fontSize: 20,
                              //     fontWeight: FontWeight.w900,
                              //   ),
                              // ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(20),
                              //       color: Colors.blue.shade100),
                              //   child: ListTile(
                              //     title: Container(
                              //       child: Image.network(
                              //           "http://192.168.43.245/Service_app/photos/${snapshot.data[id].image}"),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Etat   :      ",
                                    style: TextStyle(
                                      color: Colors.blue.shade500,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  snapshot.data[id].etat_cmd == "accepte"
                                      ? Row(
                                          children: [
                                            Text(
                                              snapshot.data[id].etat_cmd,
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Icon(Icons.done,
                                                size: 52.0,
                                                color: Colors.green),
                                          ],
                                        )
                                      : snapshot.data[id].etat_cmd == "refuses"
                                          ? Row(
                                              children: [
                                                Text(
                                                  snapshot.data[id].etat_cmd,
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Icon(Icons.cancel,
                                                    size: 30.0,
                                                    color:
                                                        Colors.deepOrange[200]),
                                              ],
                                            )
                                          : Text(
                                              snapshot.data[id].etat_cmd,
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                ],
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              const Divider(
                                color: Colors.black54,
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                            ],
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ));
}
