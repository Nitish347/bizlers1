import 'package:bizlers/APIServices/TwoWheelersAPI.dart';
import 'package:bizlers/Screens/ModelScreen.dart';
import 'package:bizlers/utils/AppTitle.dart';
import 'package:bizlers/widgets/Tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/vehicalProviders.dart';
import '../widgets/Appbar.dart';
import 'Transition.dart';

class MakeScreen extends StatelessWidget {
  String title = "Select Make";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VehicalProvider>(context);
    return Scaffold(
      appBar: Appbar(title),
      body: provider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  itemCount: provider.VehicalName.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          TwoWheelerAPI.ModelAPI(
                              context, provider.VehicalName[index]);
                          provider.updateVehical(
                              Make: provider.VehicalName[index]);
                          print(provider.Make);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ModelScreen()));
                        },
                        child: Tile(
                          subtitle: false,
                          text: provider.VehicalName[index],
                        ));
                  })),
    );
  }
}
