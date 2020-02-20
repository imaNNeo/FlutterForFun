import 'package:flutter/material.dart';
import 'package:flutter_for_fun_presentation/users_list_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primaryColor: Color(0xFF607D8B),
        primaryColorDark: Color(0xFF455A64),
        accentColor: Color(0xFF9E9E9E),
      ),
      home: UsersListPage(),
    );
  }
}







//extension on int {
//  double toRadians() => (3.14 / 180.0) * this;
//}
