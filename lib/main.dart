import 'package:flutter/material.dart';
import 'package:flutter_for_fun_presentation/backups/users_list_page_backup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: UsersListPageBackup(),
      ),
    );
  }
}

// textTheme: GoogleFonts.montserratTextTheme()
