import 'package:flutter/material.dart';

import 'package:users_repository_flutter/users_repository_flutter.dart';
import 'package:provider/provider.dart';
import 'package:app/components/prophecy.dart';
import 'feelings.dart';

class DailyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UsersRepositoryFlutter>().current;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Feelings(),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Prophecy(user: user),
            ),
          ],
        ),
      ),
    );
  }
}
