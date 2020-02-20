import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'users_list_page_backup.dart';

class UserDetailsPageBackup extends StatelessWidget {
  final UserBackup user;

  const UserDetailsPageBackup({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.loginName),
      ),
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.4,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.grey,
                BlendMode.saturation,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  user.avatarUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  child: Hero(
                    tag: user.loginName,
                    child: ClipOval(
                      child: Image.network(
                        user.avatarUrl,
                      ),
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  user.loginName,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 20,
                      )
                    ]
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '(Senior Developer)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 20,
                      )
                    ]
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
