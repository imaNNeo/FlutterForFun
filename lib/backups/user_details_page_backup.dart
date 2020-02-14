import 'package:flutter/material.dart';

import 'users_list_page_backup.dart';

class UserDetailsPageBackup extends StatelessWidget {
  final User user;

  const UserDetailsPageBackup({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.login),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Hero(
              tag: user.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  user.avatarUrl,
                  width: 220,
                  height: 220,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              user.login,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 8,
                shadows: [
                  Shadow(
                    color: Colors.black87,
                    offset: Offset(1, 1),
                    blurRadius: 14,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
