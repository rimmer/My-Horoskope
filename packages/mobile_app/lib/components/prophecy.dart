import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prophecy/bloc.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'prophecy_record.dart';
import 'prophecy_is_loading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:users_repository/users_repository.dart';
import 'package:language/language.dart';

import 'package:int_datetime/int_datetime.dart';
import 'package:algorithm/algorithm.dart';

class Prophecy extends StatelessWidget {
  final int dt;
  final UserEntity user;
  final labelStr;
  final birthRow = MutableObject(null);
  Prophecy({@required this.user, @required this.dt})
      : labelStr = "${user.model.name.capitalize()} (${userRole(user.role)})" {
    //
    final dtConverted = user.model.birth.toDateTime;
    final sign = user.model.birth.astroSign;
    //
    birthRow.wrapped = Row(
      children: <Widget>[
        SvgPicture.asset("assets/icons/$sign.svg"),
        Text(" ${dtConverted.day}.${dtConverted.month}.${dtConverted.year} ",
            style: TextStyle(fontSize: 14)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final sign = user.model.birth.astroSign;
    final userPatron = user.model.birth.astroHousePlanet;
    final currentPlanets = planetFor[dt.astroSign][sign];

    ProphecyBloc prophecyBloc = context.bloc<ProphecyBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<ProphecyBloc, ProphecyState>(
          bloc: prophecyBloc,
          builder: (context, state) {
            //
            if (state is ProphecyInitial) {
              return prophecyIsLoading(
                  user: this.user, birthRow: birthRow.wrapped);
              //

            } else if (state is ProphecyWasAsked ||
                state is ProphecyWasClarified) {
              //
              /// if big numbers in all prophecies show "impact"
              /// of user's Patron planet
              final sum = state.propheciesSum;
              if (sum > 40.0) currentPlanets[true] = userPatron;
              //
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    labelStr,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 32,
                    child: birthRow.wrapped,
                  ),
                  //

                  ProphecyRecord(
                      prophecy: state.prophecy[ProphecyType.INTERNAL_STRENGTH],
                      planetVariants: currentPlanets),
                  ProphecyRecord(
                      prophecy: state.prophecy[ProphecyType.MOODLET],
                      planetVariants: currentPlanets),
                  ProphecyRecord(
                      prophecy: state.prophecy[ProphecyType.AMBITION],
                      planetVariants: currentPlanets),
                  ProphecyRecord(
                      prophecy: state.prophecy[ProphecyType.INTELLIGENCE],
                      planetVariants: currentPlanets),
                  //
                  ProphecyRecord(
                      prophecy: state.prophecy[ProphecyType.LUCK],
                      planetVariants: currentPlanets),
                ],
                //
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
