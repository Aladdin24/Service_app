import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:projet/login/login.dart';

bool _passwordViewAdmin = true;

// String confirmPass = '';

class insicrire extends StatefulWidget {
  const insicrire({Key? key}) : super(key: key);

  @override
  State<insicrire> createState() => _insicrireState();
}

class _insicrireState extends State<insicrire> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController Nom = new TextEditingController();
  TextEditingController adresse = new TextEditingController();
  TextEditingController confirmPass = new TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? users;
  String verificationID = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future upload() async {
    final uri = Uri.parse("http://192.168.56.1/Service_app/insicrire.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['username'] = user.text;
    request.fields['Nom_client'] = Nom.text;
    request.fields['adresse_client'] = adresse.text;
    request.fields['password'] = pass.text;
    request.fields['tel_client'] = phoneController.text;
    request.fields['status_client'] = 'active';

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image Uploaded');
    } else {
      print('Image Not Uploaded');
    }
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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "S'inscrire",
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
                    "Veuillez saisir les information suivantes \npour vous s'inscrire",
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
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: TextFormField(
                    controller: user,
                    // onSaved: (val) => username = val!,
                    validator: (value) {
                      if (value!.isNotEmpty && value.length > 2) {
                        return null;
                      } else if (value.length < 3 && value.isNotEmpty) {
                        return ("Entrez un nom valide (min. 3 caractères)");
                      } else {
                        return 'Le username ne peut pas être vide';
                      }
                    },
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        size: 20.0,
                      ),
                      hintText: "nom d'utilisateur",
                      contentPadding: const EdgeInsets.all(15.0),
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Text(
                    "Nom :",
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
                    controller: Nom,
                    // onSaved: (val) => Nom_client = val!,
                    validator: (val) => val!.length == 0
                        ? 'Le nom ne peut pas être vide'
                        : null,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20.0,
                      ),
                      hintText: 'nom ',
                      contentPadding: const EdgeInsets.all(15.0),
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Text(
                    "Adresse :",
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
                    controller: adresse,
                    // onSaved: (val) => adresse_client = val!,
                    validator: (val) => val!.length == 0
                        ? 'Le adresse ne peut pas être vide'
                        : null,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_city_sharp,
                        size: 20.0,
                      ),
                      hintText: 'adresse ',
                      contentPadding: const EdgeInsets.all(15.0),
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Text(
                    "Password :",
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
                    // onSaved: (val) => password = val!,
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Le mot de passe est requis pour la connexion");
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
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Text(
                    "Conffirmer mots de paase :",
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
                    controller: confirmPass,
                    // onSaved: (val) => password = val,
                    validator: (value) {
                      if (confirmPass.text != pass.text) {
                        return "Le mot de passe ne correspond pas";
                      }
                      return null;
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
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Text(
                    "Phone :",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: TextFormField(
                    cursorColor: Colors.blue,
                    controller: phoneController,
                    validator: (val) => val!.length == 0
                        ? 'Le numero de telephone ne peut pas être vide'
                        : null,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'numéro de téléphone',
                      contentPadding: const EdgeInsets.all(15.0),
                      filled: true,
                      focusColor: Colors.grey,
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text('+222'),
                      ),
                      suffixIcon: CountryCodePicker(
                        initialSelection: '+222',
                        enabled: false,
                        hideMainText: true,
                        flagWidth: 25.0,
                      ),
                    ),
                    maxLength: 8,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                SizedBox(height: 10),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                    child: TextFormField(
                      controller: otpController,
                      validator: (val) => val!.length == 0
                          ? 'Entrez le code qui vous a ete envoye par SMS '
                          : null,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'OTP',
                        contentPadding: const EdgeInsets.all(15.0),
                        filled: true,
                        focusColor: Colors.grey,
                        prefix: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(''),
                        ),
                      ),
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  visible: otpVisibility,
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  color: Colors.blue,
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    if (otpVisibility) {
                      verifyOTP();
                    } else {
                      loginWithPhone();
                    }
                  },
                  child: Text(otpVisibility ? "Vérifier" : "S'inscrire",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+222" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("Vous êtes connecté avec succès");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          users = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
      () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "Vous etes connecte avec succes",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 8,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          upload();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => UserLogin(),
            ),
          );
        } else {
          Fluttertoast.showToast(
            msg: "Voter connexion a echoue",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 8,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }

  //   void verifyOTP() async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationID, smsCode: otpController.text);

//     await auth.signInWithCredential(credential).then(
//       (value) {
//         print("Vous êtes connecté avec succès");
//         Fluttertoast.showToast(
//           msg: "Vous êtes connecté avec succès",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.purple.shade900,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//       },
//     ).whenComplete(
//       () {
//         upload();
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => UserLogin(),
//           ),
//         );
//       },
//     );
//   }
}
