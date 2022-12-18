import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Tile extends StatelessWidget {
  String text;
  String? Stile;
  bool subtitle;
  Tile({required this.text, required this.subtitle, this.Stile});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Neumorphic(
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 1,
              lightSource: LightSource.top,
              color: Colors.white10),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.deepPurpleAccent, blurRadius: 2)
                ],
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                text,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: subtitle ? Text(Stile!) : null,
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          )),
    );
  }
}
