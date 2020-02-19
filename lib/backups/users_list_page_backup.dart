import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_for_fun_presentation/backups/user_details_page_backup.dart';

class UsersListPageBackup extends StatefulWidget {
  @override
  _UsersListPageBackupState createState() => _UsersListPageBackupState();
}

class _UsersListPageBackupState extends State<UsersListPageBackup> {
  List<User> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  void apiCall() async {
    final Response response = await Dio().get("https://api.github.com/users");
    setState(() {
      users = User.parseUsers(response.data);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Github Users'),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (_, index) => UserRowWidget(
                  users[index],
                ),
                itemCount: users.length,
              ),
      ),
    );
  }
}

class UserRowWidget extends StatelessWidget {
  final User user;

  const UserRowWidget(this.user) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) {
              return UserDetailsPageBackup(
                user: user,
              );
            },
          ),
        );
      },
      child: ListTile(
        title: Text(
          user.login,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          user.login.length.toString(),
        ),
        leading: SizedBox(
          width: 48,
          height: 48,
          child: Hero(
            tag: user.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(user.avatarUrl),
            ),
          ),
        ),
      ),
    );
  }
}

// test users
List<User> users = [
  User(20, 'kevinclark', 'https://avatars3.githubusercontent.com/u/20?v=4'),
  User(21, 'technoweenie', 'https://avatars3.githubusercontent.com/u/21?v=4'),
  User(22, 'macournoyer', 'https://avatars3.githubusercontent.com/u/22?v=4'),
  User(20, 'kevinclark', 'https://avatars3.githubusercontent.com/u/23?v=4'),
];

class User {
  final int id;
  final String login;
  final String avatarUrl;

  User(this.id, this.login, this.avatarUrl);

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

extension on int {
  double toRadians() => (3.14 / 180.0) * this;
}
