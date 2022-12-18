import 'package:bizlers/Screens/FuelType.dart';
import 'package:bizlers/providers/vehicalProviders.dart';
import 'package:bizlers/widgets/Appbar.dart';
import 'package:bizlers/widgets/Tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/AppTitle.dart';

class ModelScreen extends StatelessWidget {
  String title = "Select Model";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VehicalProvider>(context);
    return Scaffold(
      appBar: Appbar(title),
      body: provider.modelNameLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  itemCount: provider.ModelName.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          provider.updateVehical(
                              Model: provider.ModelName[index]);
                          print(provider.ModelName);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FuelTypeScreen()));
                        },
                        child: Tile(
                          subtitle: false,
                          text: provider.ModelName[index],
                        ));
                  })),
    );
  }
}
