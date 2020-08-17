import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prophecy/bloc.dart';
import 'prophecy_record.dart';
import 'package:app/screens/loading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:users_repository/users_repository.dart';
import 'package:language/language.dart';

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
    ProphecyBloc prophecyBloc = context.bloc<ProphecyBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<ProphecyBloc, ProphecyState>(
          bloc: prophecyBloc,
          builder: (context, state) {
            if (state is ProphecyInitial) {
              // @TODO redone to new widgets
              return LoadingScreen();
            } else if (state is ProphecyWasAsked ||
                state is ProphecyWasClarified) {
              // @TODO redone to const list (no list builder)
              return ListView.builder(
                shrinkWrap: false,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          labelStr,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        ),
                        birthRow.wrapped,
                      ],
                    );
                  return ProphecyRecord(
                      prophecy: (state.prophecy.values).elementAt(index - 1));
                },
                itemCount: state.prophecy.length + 1,
              );
            } else {
              return Center(
                child: Text("Error"),
              );
            }
          }),
    );
  }
}

String userRole(UserRole role) {
  if (role == UserRole.USER) return lang.you.capitalize();
}
