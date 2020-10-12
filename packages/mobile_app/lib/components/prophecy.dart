import 'package:app/single_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prophecy/bloc.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'package:provider/provider.dart';
import 'prophecy_record.dart';
import 'prophecy_is_loading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:users_repository/users_repository.dart';
import 'package:language/language.dart';

import 'package:int_datetime/int_datetime.dart';
import 'package:algorithm/algorithm.dart';

const _sumOfPropheciesToSwitchPositivePlanet = 42.0;

/// dt translates to "Date and time in milliseconds since UNIX epoch"
/// it is used in most APIs by this short name
/// sometimes it uses seconds, but mostly milliseconds
/// it is "currently perfect" way to compactly store
/// date-time in one integer value
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

    /// we create a new map and add needed variants here, to make it mutable
    final Map<bool, String> currentPlanets = {}
      ..addAll(planetFor[dt.astroSign][sign]);

    final sp = context.watch<SingleProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<ProphecyBloc, ProphecyState>(
          bloc: sp.prophecyBloc,
          builder: (context, state) {
            //
            if (state is ProphecyInitial) {
              return prophecyIsLoading(
                  user: this.user, birthRow: birthRow.wrapped);
              //

            } else if (state is ProphecyWasAsked ||
                state is ProphecyWasClarified) {
              //
              /// if sum points of all prophecies equal or more then _sumOfPropheciesToSwitchPositivePlanet
              /// change positive planet to a user patron planet,
              if (state.propheciesSum >= _sumOfPropheciesToSwitchPositivePlanet)
                currentPlanets[true] = userPatron;

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

                  prophecyRecord(
                      prophecy: state.prophecy[ProphecyType.INTERNAL_STRENGTH],
                      planetVariants: currentPlanets),
                  prophecyRecord(
                      prophecy: state.prophecy[ProphecyType.MOODLET],
                      planetVariants: currentPlanets),
                  prophecyRecord(
                      prophecy: state.prophecy[ProphecyType.AMBITION],
                      planetVariants: currentPlanets),
                  prophecyRecord(
                      prophecy: state.prophecy[ProphecyType.INTELLIGENCE],
                      planetVariants: currentPlanets),
                  //
                  prophecyRecord(
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
