import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet/screens/welcome.dart';

class PhoneScreen extends StatefulWidget {
  final int id_voiture;
  final String Marque;
  final String image;
  final String Modele;
  final String vitesses;
  final String nbr_places;
  final String Prix;
  final String Couleur;
  final String Disponibilite;

  PhoneScreen(
      {required this.id_voiture,
      required this.Marque,
      required this.image,
      required this.Modele,
      required this.vitesses,
      required this.nbr_places,
      required this.Prix,
      required this.Couleur,
      required this.Disponibilite});

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Authentification du téléphone",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.purple.shade900,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/M.jpg",
                  fit: BoxFit.cover,
                ),
                TextField(
                  cursorColor: Colors.blue,
                  controller: phoneController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade100, width: 2.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Numéro de téléphone',
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('+222'),
                    ),
                  ),
                  maxLength: 8,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 10),
                Visibility(
                  child: TextField(
                    controller: otpController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade100, width: 2.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'OTP',
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(''),
                      ),
                    ),
                    maxLength: 6,
                    keyboardType: TextInputType.number,
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
                  color: Colors.purple.shade900,
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    if (otpVisibility) {
                      verifyOTP();
                    } else {
                      loginWithPhone();
                    }
                  },
                  child: Text(otpVisibility ? "Vérifier" : "Connexion",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
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
        print("Vous êtes connecté avec succès");
        Fluttertoast.showToast(
          msg: "Vous êtes connecté avec succès",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.purple.shade900,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
    ).whenComplete(
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => wlecome(),
          ),
        );
      },
    );
  }
}
