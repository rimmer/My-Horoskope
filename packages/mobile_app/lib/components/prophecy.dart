import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prophecy/bloc.dart';
import 'package:prophecy_model/prophecy_model.dart';
import 'prophecy_record.dart';
import 'prophecy_is_loading.dart';
import 'package:app/screens/loading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:users_repository/users_repository.dart';
import 'package:app/theme/app_colors.dart';
import 'package:language/language.dart';

import 'package:int_datetime/int_datetime.dart';
import 'package:algorithm/astro.dart' show BasicAstrology;

class Prophecy extends StatelessWidget {
  final int dt;
  final UserEntity user;
  final labelStr;
  final birthRow = MutableObject(null);
  Prophecy({@required this.user, @required this.dt})
      : labelStr = "${user.model.name.capitalize()} (${userRole(user.role)})" {
    //
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
              return ProphecyIsLoading(user: this.user);
            } else if (state is ProphecyWasAsked ||
                state is ProphecyWasClarified) {
              /// the patron of current day icon
              final sum = state.propheciesSum;
              final patronColor = (sum > 35.0)
                  ? AppColors.prophecyValueNumber[2]
                  : (sum <= 25.0)
                      ? AppColors.prophecyValueNumber[0]
                      : AppColors.prophecyValueNumber[1];
              final patronPlanet = dt.dayPatron;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    labelStr,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 32,
                    child: Row(
                      children: <Widget>[
                        birthRow.wrapped,
                        // SvgPicture.asset(
                        //   "assets/icons/$patronPlanet.svg",
                        //   color: patronColor,
                        // ),
                      ],
                    ),
                  ),
                  ProphecyRecord(
                      prophecy: state.prophecy[ProphecyType.INTERNAL_STRENGTH]),
                  ProphecyRecord(
                      prophecy: state.prophecy[ProphecyType.MOODLET]),
                  ProphecyRecord(
                      prophecy: state.prophecy[ProphecyType.AMBITION]),
                  ProphecyRecord(
                      prophecy: state.prophecy[ProphecyType.INTELLIGENCE]),
                  ProphecyRecord(prophecy: state.prophecy[ProphecyType.LUCK]),
                ],
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
