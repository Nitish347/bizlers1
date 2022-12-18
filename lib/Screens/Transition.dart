import 'package:bizlers/FirebaseMetthods/uploadData.dart';
import 'package:bizlers/Screens/ProfileScreen.dart';
import 'package:bizlers/widgets/Appbar.dart';
import 'package:bizlers/widgets/Tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/vehicalProviders.dart';
import '../utils/AppTitle.dart';
import '../utils/constants.dart';

class TransmissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VehicalProvider>(context);
    return Scaffold(
      appBar: Appbar("Select Transmission"),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
              itemCount: Transmission.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      provider.updateVehical(Transmission: Transmission[index]);
                      provider.updateVehicalModel();
                      print(provider.vehical.toJson().toString());
                      FirestoreMethods().uploadData(provider.vehical.toJson());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                    mp: provider.vehical.toJson(),
                                  )));
                    },
                    child: Tile(
                      subtitle: false,
                      text: Transmission[index],
                    ));
              })),
    );
  }
}
