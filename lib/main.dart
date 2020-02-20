import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Hello world!'),),
      ),
    );
  }
}



//textTheme: GoogleFonts.montserratTextTheme(),
//primaryColor: Color(0xFF607D8B),
//primaryColorDark: Color(0xFF455A64),
//accentColor: Color(0xFF9E9E9E),


//List<User> users = [
//  User(20, 'kevinclark', 'https://avatars3.githubusercontent.com/u/20?v=4'),
//  User(21, 'technoweenie', 'https://avatars3.githubusercontent.com/u/21?v=4'),
//  User(22, 'macournoyer', 'https://avatars3.githubusercontent.com/u/22?v=4'),
//  User(20, 'kevinclark', 'https://avatars3.githubusercontent.com/u/23?v=4'),
//];

// test colors
//List<Color> colors = [
//  Colors.purpleAccent,
//  Colors.green,
//  Colors.blueAccent,
//  Colors.yellow,
//  Colors.deepPurple,
//  Colors.blueGrey,
//  Colors.pink,
//  Colors.teal
//];

//class User {
//  final int id;
//  final String loginName;
//  final String avatarUrl;
//
//  User(this.id, this.loginName, this.avatarUrl);
//
//  static User parseUser(Map<String, dynamic> json) {
//    return User(
//      json['id'],
//      json['login'],
//      json['avatar_url'],
//    );
//  }
//
//  static List<User> parseUsers(List<dynamic> usersJson) {
//    return usersJson.map((json) => User.parseUser(json)).toList();
//  }
//}


//extension on int {
//  double toRadians() => (3.14 / 180.0) * this;
//}
