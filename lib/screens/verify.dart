import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet/screens/home_screen.dart';

class verifyScreen extends StatefulWidget {
  const verifyScreen({Key? key}) : super(key: key);

  @override
  _verifyScreenState createState() => _verifyScreenState();
}

class _verifyScreenState extends State<verifyScreen> {
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      chekEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/email2.png",
                      height: 400,
                      width: 900,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 50),
                    Text('  Un courriel a été envoyé à ${user.email} ',
                    style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Text(' Veuillez vérifier  ',
                    style: TextStyle(fontWeight: FontWeight.bold),),



                    
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> chekEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
