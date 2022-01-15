import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class wlecome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<wlecome> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.indigo[200],
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text('Welcome'),
        ),
        body: Center(
          child: buildButton(),
        ),
      );

  // ignore: dead_code
  Widget buildButton() {
    final number = '46515873';

    return ListTile(
      title: Text('Numero Location'),
      subtitle: Text('$number'),
      trailing: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue),
            )),
        child: Text('Call'),
        onPressed: () async {
          launch('tel://$number');
        },
      ),
    );
  }
}
