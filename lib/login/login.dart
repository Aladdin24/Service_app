import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:projet/login/select_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'inscrire.dart';

void main() => runApp(new MyApp1());
bool _passwordViewAdmin = true;
String username = '';
String pwd = '';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login PHP My Admin',
      home: new UserLogin(),
      // routes: <String, WidgetBuilder>{
      //   '/select_service': (BuildContext context) => new SelectService(
      //         username: username,
      //       ),
      //   '/MemberPage': (BuildContext context) => new SelectService(
      //         username: username,
      //       ),
      //   '/UserLogin': (BuildContext context) => new UserLogin(),
      // },
    );
  }
}

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController Nom_client = new TextEditingController();
  TextEditingController prenome_client = new TextEditingController();
  TextEditingController adresse_client = new TextEditingController();
  TextEditingController phon = new TextEditingController();
  TextEditingController id = new TextEditingController();
  String msg = "Votre nom d'utilisateur ou mot de passe invalide";
  String? usernamev;
  String? password;

  Future<List> _login() async {
    final response = await http
        .post(Uri.parse("http://192.168.56.1/Service_app/login.php"), body: {
      "username": user.text,
      "pwd": pass.text,
      "id_client": id.text,
      "Nom_client": Nom_client.text,
      "prenome_client": prenome_client.text,
      "adresse_client": adresse_client.text,
      "tel_clinet": phon.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        _showerr();
      });
    } else {
      if (datauser[0]['status_client'] == 'active') {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SelectService(
            username: username,
            pwd: pwd,
          ),
        ));
      } else if (datauser[0]['status_client'] == 'member') {
        Navigator.pushReplacementNamed(context, '/MemberPage');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }

    return datauser;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final formKey = new GlobalKey<FormState>();

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.blue.shade100,
          content: Row(
            children: <Widget>[
              // new CircularProgressIndicator(),
              SizedBox(
                width: 25.0,
              ),
              new Text(
                "Please waite",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red.shade300,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showerr() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: Icon(Icons.cancel, size: 30.0, color: Colors.deepOrange[200]),
          content: Text(
            "Votre nom d'utilisateur ou mot de passe invalide!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red.shade300,
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

  AppBar loginAppBar({required String title, context}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: IconButton(
          icon: Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.blue,
        ),
      ),
      title: Text(
        title,
        style:
            TextStyle(fontFamily: " ", color: Colors.black54, fontSize: 18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loginAppBar(title: " ", context: context),
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          primary: false,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Quando',
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Veuillez saisir les information suivantes \npour vous connecter',
                    style: TextStyle(
                      color: Colors.black38,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Text(
                    "Nom d'utilisateur :",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    controller: user,
                    keyboardType: TextInputType.name,
                    onSaved: (value) {
                      user.text = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Veuillez saisir votre nom d'utilisateur");
                      }
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        size: 20.0,
                      ),
                      hintText: "nom d'utilisateur ",
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Text(
                    "Mot de passe :",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: TextFormField(
                    controller: pass,
                    onSaved: (value) {
                      pass.text = value!;
                    },
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Veuillez saisir votre mot de passe");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Entrez un mot de passe valide (min. 6 caractères)");
                      }
                    },
                    obscureText: _passwordViewAdmin,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20.0,
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            size: 20.0,
                          ),
                          onPressed: () {
                            if (_passwordViewAdmin) {
                              setState(() {
                                _passwordViewAdmin = false;
                              });
                            } else {
                              setState(() {
                                _passwordViewAdmin = true;
                              });
                            }
                          }),
                      hintText: '***********',
                      contentPadding: const EdgeInsets.all(15.0),
                      filled: true,
                      focusColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                    child: MaterialButton(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          _login();
                        },
                        child: Text(
                          "Connexion",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vous n'avez pas de compte ? "),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => insicrire()));
                        },
                        child: Text(
                          "S'inscrire ",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Colors.blue.shade500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
