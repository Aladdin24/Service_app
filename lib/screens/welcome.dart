import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class wlecome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<wlecome> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text('Bienvenue'),
          centerTitle: true,
        ),
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                     Image.asset(
                      "assets/phone-call.png",
                      height: 550,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                     buildButton(),
                  ],
                  
          ),
          
          
          
        ),
      );

  // ignore: dead_code
  Widget buildButton() {
    final number = '46515873';

    return ListTile(
      title: Text('Numero Location',style: TextStyle(fontWeight:FontWeight.bold ),),
      subtitle: Text('$number'),
      trailing: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            )),
        child: Icon(Icons.call,color: Colors.black,size: 35,),
        onPressed: () async {
          launch('tel://$number');
        },
      ),
    );
  }
}
