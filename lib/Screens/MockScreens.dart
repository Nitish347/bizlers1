import 'package:bizlers/APIServices/TwoWheelersAPI.dart';
import 'package:bizlers/Screens/MakeScreen.dart';
import 'package:bizlers/models/vehicalModel.dart';
import 'package:bizlers/providers/vehicalProviders.dart';
import 'package:bizlers/utils/AppTitle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/Appbar.dart';

class MockScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String title = "Create new vehical profile";
  Vehical? vehical;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VehicalProvider>(context);
    return Scaffold(
        appBar: Appbar(title),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            print(provider.VehicalNumber);
            if (formKey.currentState!.validate()) {
              if (provider.isLoading) TwoWheelerAPI.NameAPI(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MakeScreen()));
            }
          },
          child: Icon(Icons.arrow_forward_ios_outlined),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "VEHICAL NUMBER",
                    style: GoogleFonts.poppins(
                        fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty || val == null) {
                      return "Enter the vehical number";
                    }
                  },
                  onChanged: (val) =>
                      provider.updateVehical(VehicalNumber: val),
                  decoration: InputDecoration(
                      hintText: "Enter Vehical No.",
                      labelText: "Vehical Number",
                      filled: true,
                      fillColor: Colors.blueAccent.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                )
              ],
            ),
          ),
        ));
  }
}
