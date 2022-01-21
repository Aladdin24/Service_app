import 'package:flutter/material.dart';
import 'package:projet/screens/phone.dart';
import 'package:projet/voiture/utils/utils.dart';
import 'package:projet/voiture/widget/specific_card1.dart';
import 'package:projet/voiture/widget/specific_card.dart';

class TypeVoiture extends StatelessWidget {
  final int id_voiture;
  final String Marque;
  final String image;
  final String Modele;
  final String vitesses;
  final String nbr_places;
  final String Prix;
  final String Couleur;
  final String Disponibilite;

  TypeVoiture(
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(Marque, style: MainHeading),
          Text(
            Modele,
            style: BasicHeading,
          ),
          SizedBox(
              width: 400,
              height: 200,
              child: Hero(
                  tag: Marque,
                  child: Image.network(
                      "http://192.168.181.11/location/uploads/${image}"))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpecificsCard(
                name: 'Par Jour',
                price: Prix,
                name2: 'UMR',
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            Disponibilite,
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpecificsCard1(
                name: 'Couleur',
                name2: Couleur,
              ),
              SpecificsCard1(
                name: 'Vitesses',
                name2: vitesses,
              ),
              SpecificsCard1(
                name: 'Place',
                name2: nbr_places,
              )
            ],
          ),
          SizedBox(height: 15),
          MaterialButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PhoneScreen(
                      id_voiture: id_voiture,
                      Marque: Marque,
                      image: image,
                      Modele: Modele,
                      vitesses: vitesses,
                      nbr_places: nbr_places,
                      Prix: Prix,
                      Couleur: Couleur,
                      Disponibilite: Disponibilite,
                    ))),
            child: Text(
              "Reserve Maintenant",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),),
            color: Colors.purple.shade900,
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width,
          )
          // RaisedButton(
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //   disabledColor: Colors.purple.shade900,
          //   onPressed: () => Navigator.of(context)
          //       .push(MaterialPageRoute(builder: (context) => PhoneScreen())),
          //   child: Text(
          //     'Reserve Maintenant',
          //     style: TextStyle(fontSize: 20, color: Colors.white),
          //   ),
          // )
        ],
      ),
    );
  }
}
