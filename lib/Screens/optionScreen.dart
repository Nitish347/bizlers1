import 'package:bizlers/Screens/MakeScreen.dart';
import 'package:bizlers/widgets/Appbar.dart';
import 'package:bizlers/widgets/grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../APIServices/VehicalAPI.dart';
import '../providers/vehicalProviders.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VehicalProvider>(context);
    return Scaffold(
      appBar: Appbar("Class Selection"),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                provider.updateCls("2");
                if (provider.isLoading) VehicalAPI.NameAPI(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MakeScreen()));
              },
              child: Container(
                height: 100,
                width: 150,
                child: grid(
                  title: "Class",
                  subtitle: "Bike",
                ),
              ),
            ),
            InkWell(
              onTap: () {
                provider.updateCls("4");
                if (provider.isLoading) VehicalAPI.NameAPI(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MakeScreen()));
              },
              child: Container(
                height: 100,
                width: 150,
                child: grid(
                  title: "Class",
                  subtitle: "Car",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
