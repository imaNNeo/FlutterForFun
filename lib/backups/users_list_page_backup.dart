import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_for_fun_presentation/backups/user_details_page_backup.dart';

class UsersListPageBackup extends StatefulWidget {
  @override
  _UsersListPageBackupState createState() => _UsersListPageBackupState();
}

class _UsersListPageBackupState extends State<UsersListPageBackup> {
  List<UserBackup> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  void apiCall() async {
    final Response response = await Dio().get("https://api.github.com/users");
    setState(() {
      users = UserBackup.parseUsers(response.data);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Users'),
      ),
      body: (isLoading)
        ? Center(
        child: CircularProgressIndicator(),
      )
        : ListView.builder(
        itemBuilder: (context, index) {
          return UserWidgetBackup(users[index]);
        },
        itemCount: users.length,
      ),
    );
  }
}

class UserWidgetBackup extends StatelessWidget {
  final UserBackup user;

  const UserWidgetBackup(this.user) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) {
              return UserDetailsPageBackup(user: user);
            },
          ),
        );
      },
      child: ListTile(
        title: Text(user.loginName),
        subtitle: Text(
          user.loginName.length.toString(),
        ),
        leading: Hero(
          tag: user.loginName,
          child: ClipOval(
            child: Image.network(
              user.avatarUrl,
              width: 48,
              height: 48,
            ),
          ),
        ),
      ),
    );
  }
}

// test users
List<UserBackup> users = [
  UserBackup(20, 'kevinclark', 'https://avatars3.githubusercontent.com/u/20?v=4'),
  UserBackup(21, 'technoweenie', 'https://avatars3.githubusercontent.com/u/21?v=4'),
  UserBackup(22, 'macournoyer', 'https://avatars3.githubusercontent.com/u/22?v=4'),
  UserBackup(20, 'kevinclark', 'https://avatars3.githubusercontent.com/u/23?v=4'),
];

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

class UserBackup {
  final int id;
  final String loginName;
  final String avatarUrl;

  UserBackup(this.id, this.loginName, this.avatarUrl);

  static UserBackup parseUser(Map<String, dynamic> json) {
    return UserBackup(
      json['id'],
      json['login'],
      json['avatar_url'],
    );
  }

  static List<UserBackup> parseUsers(List<dynamic> usersJson) {
    return usersJson.map((json) => UserBackup.parseUser(json)).toList();
  }
}

extension on int {
  double toRadians() => (3.14 / 180.0) * this;
}
