import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  user.avatarUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.fitHeight,
                ),
                foregroundDecoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.saturation,
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 4,
                  ),
                  Hero(
                    tag: user.id,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 2,
                      foregroundDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(user.avatarUrl),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 10,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    user.login,
                    style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
                          )
                        ]),
                  ),
                  Text(
                    "(Senior Developer)",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                      shadows: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
