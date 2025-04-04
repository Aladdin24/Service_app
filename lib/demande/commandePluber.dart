import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:projet/custom/datePicker.dart';
import 'package:intl/intl.dart';
import 'package:projet/login/select_service.dart';
import 'package:projet/pages/plumber.dart';

class commandePlb extends StatefulWidget {
  final int id_entreprise;
  final String Nom_ent;
  // final String id_categorie;
  final String photo;
  final double evaluation;
  final String username;
  final String pwd;
  commandePlb(
      {required this.id_entreprise,
      required this.Nom_ent,
      // required this.id_categorie,
      required this.photo,
      required this.evaluation,
      required this.username,
      required this.pwd});

  @override
  _commandePlbState createState() => _commandePlbState(
      // id_categorie: id_categorie,
      Nom_ent: Nom_ent,
      id_entreprise: id_entreprise,
      photo: photo,
      evaluation: evaluation,
      pwd: pwd,
      username: username);
}

class _commandePlbState extends State<commandePlb> {
  final int id_entreprise;
  final String Nom_ent;
  // final String id_categorie;
  final String photo;
  final double evaluation;
  final String username;
  final String pwd;
  _commandePlbState(
      {required this.id_entreprise,
      required this.Nom_ent,
      // required this.id_categorie,
      required this.photo,
      required this.evaluation,
      required this.username,
      required this.pwd});
  TextEditingController delai = TextEditingController();
  TextEditingController Description = TextEditingController();
  bool editMode = false;
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  double? rating;

  Future upload() async {
    final uri = Uri.parse("http://192.168.56.1/Service_app/upload.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['Nom_commande'] = 'Plumber';
    request.fields['username'] = '$username';
    request.fields['delai'] = '$tgl';
    request.fields['id_entreprise'] = '$id_entreprise';
    request.fields['prix'] = '5000';
    request.fields['Description'] = Description.text;
    request.fields['etat_cmd'] = 'en attends ....';
    var pic = await http.MultipartFile.fromPath("image", _imageFile!.path);
    request.files.add(pic);

    var response = await request.send();
  }

  Future evaluer() async {
    var uri = Uri.parse("http://192.168.56.1/Service_app/edit.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['id_entreprise'] = widget.id_entreprise.toString();
    request.fields['evaluation'] = "$evaluation" "$rating ";

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image Uploaded');
    } else {
      print('Image Not Uploaded');
    }
  }

  String? pilihTanggal;
  String labelText = '';
  DateTime tgl = new DateTime.now();
  final TextStyle valueStyle = TextStyle(fontSize: 16.0);
  Future<Null> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tgl,
        firstDate: DateTime(2022),
        lastDate: DateTime(2030));

    if (picked != null && picked != tgl) {
      setState(() {
        tgl = picked;
        pilihTanggal = new DateFormat.yMd().format(tgl);
      });
    } else {}
  }

  void _showerr() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: Column(
            children: [
              Center(
                  child: Text(
                "$username",
                style: TextStyle(
                  color: Colors.purple.shade900,
                ),
              )),
              Row(
                children: [
                  Text("Entreprise: "),
                  Text(
                    "$Nom_ent ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Service: ",
                  ),
                  Text(
                    "Plombier",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
          content: Text(
            "Appuyer sur Envoyer pour confirmer",
            style: TextStyle(
              fontSize: 16,
              color: Colors.purple.shade900,
            ),
          ),
          actions: [
            CupertinoDialogAction(
                child: Text(
                  "Envoyer",
                ),
                onPressed: () {
                  Navigator.pop(context);
                  upload();
                  ok();
                })
          ],
        );
      },
    );
  }

  void ok() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: Icon(Icons.done, size: 52.0, color: Colors.green),
          content: Text(
            "Votre demande est arrivee maintenant attendez que vous soyer repondu",
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
          actions: [
            CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Plumber(
                            username: username,
                            pwd: '',
                          )));
                })
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _imageFile == null
                  ? Text(
                      Nom_ent,
                      style: TextStyle(
                        color: Colors.blue.shade500,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  : Text(
                      "Votre probleme",
                      style: TextStyle(
                        color: Colors.blue.shade500,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
              SizedBox(
                  width: 400,
                  height: 200,
                  child: ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrange[100]),
                      child: _imageFile == null
                          ? Column(
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
                                      ": $evaluation",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextButton(
                                      child: Text(
                                        "Evaluer",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.blue),
                                      ),
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                  title: Text(
                                                      'Evaluer cette entreprise'),
                                                  content: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "Veuillez laisser une note d'etoile.",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 32,
                                                      ),
                                                      RatingBar.builder(
                                                        // initialRating: rating,
                                                        maxRating: 1,
                                                        itemSize: 46,
                                                        itemBuilder:
                                                            (context, _) =>
                                                                Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        updateOnDrag: true,
                                                        onRatingUpdate:
                                                            (rating) =>
                                                                setState(() {
                                                          this.rating = rating;
                                                        }),
                                                      ),
                                                    ],
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          evaluer();
                                                        },
                                                        child: Text(
                                                          'OK',
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ))
                                                  ])),
                                    ),
                                  ],
                                ),
                                Image.network(
                                    "http://192.168.56.1/Service_app/photos/${photo}"),
                              ],
                            )
                          : Image.file(_imageFile!),
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  children: [
                    Text(
                      "Choisissez quand vous voulez le service",
                      style: TextStyle(
                        leadingDistribution: TextLeadingDistribution.even,
                        color: Colors.blue,
                      ),
                    ),
                    DateDropDown(
                      labelText: labelText,
                      valueText: new DateFormat.yMd().format(tgl),
                      valueStyle: valueStyle,
                      onPressed: () {
                        _selectedDate(context);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextFormField(
                            minLines: 3,
                            maxLines: 10,
                            controller: Description,
                            decoration: InputDecoration(
                              labelText: 'Entrez une description',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: _imageFile == null
                          ? Text(
                              'Vous pouvez prendre une photo si vous avez un probleme',
                              style: TextStyle(
                                leadingDistribution:
                                    TextLeadingDistribution.even,
                                color: Colors.blue,
                              ),
                            )
                          : Text(""),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet()),
                          );
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                          size: 28.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    MaterialButton(
                      onPressed: () {
                        _showerr();
                      },
                      child: Text(
                        "Commander Maintenant",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      elevation: 2,
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
            ],
          ),
        ),
      ),
    );
  }

  //  Widget imagePrblm() {
  //   return Center(
  //     child: InkWell(
  //       onTap: () {
  //         showModalBottomSheet(
  //           context: context,
  //           builder: ((builder) => bottomSheet()),
  //         );
  //       },
  //       child: Icon(
  //         Icons.camera_alt,
  //         color: Colors.teal,
  //         size: 28.0,
  //       ),
  //     ),
  //   );
  // }
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }
}
