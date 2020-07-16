import 'package:flutter/material.dart';
import 'package:users_repository/users_repository.dart';
import 'package:language/language.dart';
import 'prophecy_records.dart';

class Prophecy extends StatelessWidget {
  final UserEntity user;
  final labelStr;
  Prophecy({@required this.user})
      : labelStr = "${user.model.name.capitalize()} (${lang.you.capitalize()})";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              labelStr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            Expanded(child: Records()),
          ],
        ),
      ),
    );
  }
}
