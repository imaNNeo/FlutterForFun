import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_for_fun_presentation/user_details_page.dart';

class UsersListPage extends StatefulWidget {
  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  List<User> users = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  void apiCall() async {
    Response response = await Dio().get("https://api.github.com/users");
    setState(() {
      users = User.parseUsers(response.data);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Github'),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListWheelScrollView.useDelegate(
          useMagnifier: true,
                magnification: 1.2,
                itemExtent: 80,
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    return UserRow(users[index]);
                  },
                  childCount: users.length,
                ),
              ));
  }
}

class UserRow extends StatelessWidget {
  final User user;

  const UserRow(this.user) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      color: colors[Random().nextInt(colors.length)  ],
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return UserDetailsPage(user);
          }));
        },
        child: ListTile(
          leading: Hero(
            tag: user.id,
            child: ClipOval(
              child: Image.network(user.avatarUrl),
            ),
          ),
          title: Text(user.loginName),
          subtitle: Text(user.loginName.length.toString()),
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String loginName;
  final String avatarUrl;

  User(this.id, this.loginName, this.avatarUrl);

  static User parseUser(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['login'],
      json['avatar_url'],
    );
  }

  static List<User> parseUsers(List<dynamic> usersJson) {
    return usersJson.map((json) => User.parseUser(json)).toList();
  }
}

// test colors
List<Color> colors = [
  Colors.purpleAccent,
  Colors.green,
  Colors.blueAccent,
  Colors.yellow,
  Colors.deepPurple,
  Colors.blueGrey,
  Colors.pink,
  Colors.teal
];
