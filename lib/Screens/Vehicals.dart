import 'package:bizlers/Screens/MockScreens.dart';
import 'package:bizlers/Screens/ProfileScreen.dart';
import 'package:bizlers/models/vehicalModel.dart';
import 'package:bizlers/widgets/Appbar.dart';
import 'package:bizlers/widgets/Tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Vehicals extends StatelessWidget {
  const Vehicals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar("Vehicals"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MockScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('vehicals').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                  child: InkWell(
                onTap: () {
                  // Vehical vehical = Vehical.fromMap()
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                              mp: document.data() as Map<String, dynamic>)));
                },
                child: Tile(
                  text: document["VehicalNumber"],
                  subtitle: true,
                  Stile: "${document["Make"]} ${document["Model"]}",
                ),
              ));
            }).toList(),
          );
        },
      ),
    );
  }
}
