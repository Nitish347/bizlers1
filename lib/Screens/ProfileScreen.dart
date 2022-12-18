import 'package:bizlers/Screens/Vehicals.dart';
import 'package:bizlers/providers/vehicalProviders.dart';
import 'package:bizlers/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../widgets/Tile.dart';
import '../widgets/grid.dart';

class ProfileScreen extends StatelessWidget {
  Map<String, dynamic> mp;
  ProfileScreen({required this.mp});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VehicalProvider>(context);
    List<String> title = ["MAKE", "MODEL", "FUEL TYPE", "TRANSMISSION"];
    List<String> subtitle = [
      mp["Make"],
      mp["Model"],
      mp["FuelType"],
      mp["Transmission"]
    ];
    return Scaffold(
      body: Column(
        children: [
          Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                depth: 10,
                // lightSource: LightSource.top,
                color: Colors.deepPurpleAccent),
            child: Container(
              color: Colors.blueAccent,
              height: MediaQuery.of(context).size.height / 2.3,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 12, right: 12, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Vehicals()));
                        },
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.white)),
                    ListTile(
                      title: Text(
                        "${mp["Model"]} ${mp["FuelType"]}",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                      subtitle: Text(
                        mp["VehicalNumber"],
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 40.0,
                    mainAxisExtent: 120),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                children: List.generate(4, (index) {
                  return GridTile(
                      child: grid(
                    title: title[index],
                    subtitle: subtitle[index],
                  ));
                })),
          ),
        ],
      ),
    );
  }
}
