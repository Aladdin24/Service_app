import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet/animation/FadeAnimation.dart';
import 'package:projet/login/login.dart';
import 'package:projet/pages/driver.dart';
import 'package:flutter/material.dart';
import 'package:projet/pages/electrician.dart';
import 'package:projet/pages/plumber.dart';
import '../main.dart';
import '../pages/notification.dart';

// String? pwd = '';

class SelectService extends StatefulWidget {
  SelectService({
    required this.username,
    required this.pwd,
    // required this.pwd
  });
  final String username;
  final String pwd;

  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Divider(
                    color: Colors.black54,
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Deconnexion'),
                    onTap: () {
                      logout(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
                child: FadeAnimation(
              1,
              Padding(
                padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
                child: Text(
                  'Choisir le \nservice',
                  style: TextStyle(
                    color: Colors.deepOrange[100],
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ))
          ];
        },
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Plumber(
                            username: username,
                            pwd: pwd,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png",
                            alignment: Alignment.topCenter,
                          ),
                          Text(
                            "Plombier",
                            style: TextStyle(
                                color: Colors.deepOrange[200], fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Electrician(
                            username: username,
                            pwd: pwd,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png",
                            alignment: Alignment.topCenter,
                          ),
                          Text(
                            "Electricien",
                            style: TextStyle(
                                color: Colors.deepOrange[200], fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png",
                            alignment: Alignment.topCenter,
                          ),
                          Text(
                            "Peintre",
                            style: TextStyle(
                                color: Colors.deepOrange[200], fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://pngimg.com/uploads/wifi/wifi_PNG62249.png",
                            width: 90,
                            height: 90,
                          ),
                          Text(
                            "Wi-Fi",
                            style: TextStyle(
                                color: Colors.deepOrange[200], fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverPage(
                            username: username,
                            pwd: pwd,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/2x/external-driver-women-profession-sbts2018-lineal-color-sbts2018.png",
                            alignment: Alignment.topCenter,
                          ),
                          Text(
                            "Chauffeur",
                            style: TextStyle(
                                color: Colors.deepOrange[200], fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => UserLogin()));
  }
}

// class NavigationDrawer extends StatelessWidget {
//   NavigationDrawer({
//     required this.username,
//     required this.pwd,
//     // required this.pwd
//   });
//   final String username;
//   final String pwd;
//   // ignore: empty_constructor_bodies
//   @override
//   Widget build(BuildContext context) => Drawer(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Material(
//                 color: Colors.blue,
//                 child: InkWell(
//                   onTap: () {},
//                   child: Container(
//                     padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).padding.top,
//                     ),
//                     child: Column(
//                       children: const [
//                         CircleAvatar(
//                           radius: 52,
//                           backgroundImage: AssetImage("assts/user.png"),
//                         ),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         Text("username",
//                             style:
//                                 TextStyle(fontSize: 28, color: Colors.white)),
//                         Text(
//                           'username@gamil.com',
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Wrap(
//                 children: [
//                   ListTile(
//                     leading: const Icon(Icons.home_outlined),
//                     title: const Text('Home'),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SelectService(
//                             username: username,
//                             pwd: pwd,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.favorite),
//                     title: const Text('Favorites'),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.workspaces_outline),
//                     title: const Text('Workflow'),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.update),
//                     title: const Text('Updates'),
//                     onTap: () {},
//                   ),
//                   const Divider(
//                     color: Colors.black54,
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.account_tree_outlined),
//                     title: const Text('Plugins'),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.notifications_outlined),
//                     title: const Text('Notifications'),
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
// }
