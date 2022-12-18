import 'package:bizlers/Screens/Transition.dart';
import 'package:bizlers/widgets/Tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/vehicalProviders.dart';
import '../utils/AppTitle.dart';
import '../utils/constants.dart';
import '../widgets/Appbar.dart';

class FuelTypeScreen extends StatelessWidget {
  String title = "Select Fuel Type";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VehicalProvider>(context);
    return Scaffold(
      appBar: Appbar(title),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
              itemCount: FuelType.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      provider.updateVehical(FuelType: FuelType[index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransmissionScreen()));
                    },
                    child: Tile(subtitle: false, text: FuelType[index]));
              })),
    );
  }
}
