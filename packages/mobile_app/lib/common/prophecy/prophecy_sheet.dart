import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_horoskope/theme/app_colors.dart';
import 'package:text/text.dart';
import 'package:base/prophecy/entity/prophecy.dart';
import 'package:base/preferences/setting/enabled_prophecies/item.dart';

import '../title_with_description.dart';
import 'prophecy_record.dart';
import 'prophecy_sheet_divider.dart';

const PROPHECY_PADDING_HORIZONTAL = 16.0;

class ProphecySheet extends StatelessWidget {
  final Map<ProphecyType, ProphecyEntity> prophecies;
  final Map<bool, String> planets;
  final EnabledProphecies toShow;

  const ProphecySheet({
    @required this.prophecies,
    @required this.planets,
    @required this.toShow,
  });

  @override
  Widget build(BuildContext context) {
    final propheciesSheet = <Widget>[
      /// yourProphecies title and notation

      if (toShow.moodlet)
        ProphecyRecord(prophecy: prophecies[ProphecyType.ROOT]),
      if (toShow.luck)
        ProphecyRecord(prophecy: prophecies[ProphecyType.SACRAL]),
      if (toShow.ambition)
        ProphecyRecord(prophecy: prophecies[ProphecyType.SOLAR]),
      if (toShow.internalStrength)
        ProphecyRecord(prophecy: prophecies[ProphecyType.HEART]),
      if (toShow.intuition)
        ProphecyRecord(prophecy: prophecies[ProphecyType.THROAT]),

      /// if all prophecies are disabled show luck
      if (toShow.internalStrength == false &&
          toShow.moodlet == false &&
          toShow.ambition == false &&
          toShow.intuition == false &&
          toShow.luck == false)
        ProphecyRecord(prophecy: prophecies[ProphecyType.SACRAL]),
    ];
    //

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),

      /// Background gradient
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.prophecyGradientStart.withOpacity(0.9),
              AppColors.prophecyGradientEnd.withOpacity(0.9),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(8.0)),

      /// main list view
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          /// planet impact
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
                horizontal: PROPHECY_PADDING_HORIZONTAL),
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              TitleWithDescription(
                padding: const EdgeInsets.only(
                  top: 14.0,
                  left: 3.0,
                ),
                title: localeText.impactPlanets.capitalize(),
                notation: localeText.impactPlanetsHint,
              ),
              Container(
                height: 64.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                            " ${localeText.planetImpactName[planets[false]]} "),
                        SvgPicture.asset("assets/icons/${planets[false]}.svg",
                            color: AppColors.negativeImpact),
                      ],
                    ),
                    Row(
                      children: [
                        Text(" ${localeText.planetImpactName[planets[true]]} "),
                        SvgPicture.asset("assets/icons/${planets[true]}.svg",
                            color: AppColors.positiveImpact),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),

          //
          const ProphecySheetDivider(),

          /// prophecies listview
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: PROPHECY_PADDING_HORIZONTAL,
              right: PROPHECY_PADDING_HORIZONTAL,
              bottom: 12.0,
            ),
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            children: propheciesSheet,
          ),
        ],
      ),
    );
  }
}
