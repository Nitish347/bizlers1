import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget Appbar( String title) {
  return AppBar(
    toolbarHeight: 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    backgroundColor: Colors.blue.shade700,
    centerTitle: true,
    title: Text(
      title,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 25,
          color: Colors.white,
          shadows: [BoxShadow(color: Colors.black, blurRadius: 5)]),
    ),
  );
}
