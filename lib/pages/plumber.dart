import 'dart:convert';
import 'package:projet/animation/FadeAnimation.dart';
import 'package:projet/demande/commandePluber.dart';
import 'package:projet/login/login.dart';
import 'package:projet/login/select_service.dart';
import 'package:projet/models/enterprise.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'notification.dart';

class Plumber extends StatefulWidget {
  Plumber({
    required this.username,
    required this.pwd,
    // required this.pwd
  });
  final String username;
  final String pwd;

  @override
  _PlumberState createState() => _PlumberState();
}

class _PlumberState extends State<Plumber> {
  Future allPerson() async {
    var url = "http://192.168.56.1/Service_app/viewPlb.php";
    var response = await http.get(Uri.parse(url));

    var jsonData = json.decode(response.body);

    List<Enterprise> enterprises = [];

    for (var v in jsonData) {
      Enterprise enterprise = Enterprise(
          int.parse(v["id_entreprise"]),
          v["Nom_ent"],
          v["photo"],
          int.parse(v["id_categorie"]),
          double.parse(v["evaluation"]));

      enterprises.add(enterprise);
    }
    print(enterprises.length);

    return enterprises;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Material(
                  color: Colors.blue.shade100,
                  child: InkWell(
                    onTap: () {},
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: CircleAvatar(
                          radius: 52,
                          backgroundImage: AssetImage("assets/user.png"),
                        ),
                      ),
                      Text('$username',
                          style: TextStyle(fontSize: 28, color: Colors.black)),
                      // Text(
                      //   '$username@gamil.com',
                      //   style: TextStyle(fontSize: 16, color: Colors.black),
                      // ),
                    ]),
                  ),
                ),
                Wrap(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home_outlined),
                      title: const Text('Home'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectService(
                              username: username,
                              pwd: pwd,
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.notifications_outlined),
                      title: const Text('Notifications'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => notification(
                              username: username,
                              pwd: pwd,
                            ),
                          ),
                        );
                      },
                    ),
                    // const Divider(
                    //   color: Colors.black54,
                    // ),
                    // ListTile(
                    //   leading: const Icon(Icons.logout),
                    //   title: const Text('Deconnexion'),
                    //   onTap: () {
                    //     logout(context);
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                    child: FadeAnimation(
                  1,
                  Padding(
                    padding:
                        EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
                    child: Text(
                      "Choisissez L'entreprise qui soihaite vous fournir le service?",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepOrange[100],
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ))
              ];
            },
            body: RefreshIndicator(
              color: Colors.blue,
              onRefresh: () {
                return Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (a, b, c) => Plumber(
                              username: username,
                              pwd: '',
                            )));
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                body: FutureBuilder(
                  future: allPerson(),
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
                                    Center(
                                      child: Text(
                                        snapshot.data[id].Nom_ent,
                                        style: TextStyle(
                                          color: Colors.blue.shade500,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.blue.shade100),
                                      child: ListTile(
                                        title: Column(
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                  child: Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                Text(
                                                  ": ${snapshot.data[id].evaluation}",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              child: Image.network(
                                                  "http://192.168.56.1/Service_app/photos/${snapshot.data[id].photo}"),
                                            ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          "Plumber",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 20),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    commandePlb(
                                                  id_entreprise: snapshot
                                                      .data[id].id_entreprise,
                                                  Nom_ent:
                                                      snapshot.data[id].Nom_ent,
                                                  // id_categorie: snapshot
                                                  //     .data[id].id_categorie,
                                                  photo:
                                                      snapshot.data[id].photo,
                                                  evaluation: snapshot
                                                      .data[id].evaluation,
                                                  username: username,
                                                  pwd: pwd,
                                                ),
                                              ));
                                        },
                                      ),
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
            )));
  }
}
