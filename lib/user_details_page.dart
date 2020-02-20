import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_for_fun_presentation/users_list_page.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;

  const UserDetailsPage(this.user) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.loginName),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Opacity(
              opacity: 0.4,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
                child: Image.network(
                  user.avatarUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  child: Hero(
                    tag: user.id,
                    child: ClipOval(
                      child: Image.network(user.avatarUrl),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 8, color: Colors.white,)
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  user.loginName,
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 10,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "(Senior Developer)",
                  style: TextStyle(
                    fontSize: 16,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 10,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
