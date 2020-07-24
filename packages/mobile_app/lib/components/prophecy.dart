import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:users_repository/users_repository.dart';
import 'package:language/language.dart';
import 'prophecy_records.dart';

import 'package:int_datetime/int_datetime.dart';
import 'package:algorithm/astro.dart' show BasicAstrology;

class Prophecy extends StatelessWidget {
  final UserEntity user;
  final labelStr;
  final birthRow = MutableObject(null);
  Prophecy({@required this.user})
      : labelStr = "${user.model.name.capitalize()} (${userRole(user.role)})" {
    final dt = user.model.birth.toDateTime;
    final sign = user.model.birth.astroSign;
    final mainPlanet = user.model.birth.astroHousePlanet;
    birthRow.wrapped = Row(
      children: <Widget>[
        SvgPicture.asset("assets/icons/$sign.svg"),
        Text(" ${dt.day}.${dt.month}.${dt.year} ",
            style: TextStyle(fontSize: 14)),
        SvgPicture.asset("assets/icons/$mainPlanet.svg"),
      ],
    );
  }

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
            birthRow.wrapped,
            Expanded(child: Records()),
          ],
        ),
      ),
    );
  }
}

String userRole(UserRole role) {
  if (role == UserRole.USER) return lang.you.capitalize();
}
