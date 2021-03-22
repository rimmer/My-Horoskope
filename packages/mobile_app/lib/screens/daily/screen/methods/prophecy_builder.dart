part of '../screen.dart';

extension DailyScreenProphecyBuilder on _DailyScreenState {
  Widget prophecyBuilder(BuildContext context, ProphecyState state) {
    //

    if (state is ProphecyInitial) {
      return SizedBox();
      //

    } else if (state is ProphecyWasAsked) {
      //
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// {NAME} {ROLE}
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 16.0,
            ),
            child: Text(
              dat.labelStr,
              style: AppTextStyle.userName,
            ),
          ),

          /// {Astrosign} {Birthdate}
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              bottom: 8.0,
            ),
            child: SizedBox(
              height: 32,
              child: dat.birthRow,
            ),
          ),

          /// Prophecy Sheet
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            padding: EdgeInsets.symmetric(
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
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                /// prophecies listview
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    left: PROPHECY_PADDING_HORIZONTAL,
                    right: PROPHECY_PADDING_HORIZONTAL,
                    bottom: 12.0,
                  ),
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    /// yourProphecies title and notation
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 3.0,
                        bottom: 8.0,
                      ),
                      child: TitleWithDescription(
                        title: localeText.yourProphecies.capitalize(),
                        notation: localeText.yourPropheciesHint,
                      ),
                    ),
                    //

                    (toShow.internalStrength)
                        ? Builder(
                            builder: (_) => SlideTransition(
                              position: dat.animationProphecyInternalStr,
                              child: prophecyRecord(
                                prophecy: state
                                    .prophecy[ProphecyType.INTERNAL_STRENGTH],
                              ),
                            ),
                          )
                        : SizedBox(),
                    (toShow.moodlet)
                        ? Builder(
                            builder: (_) => SlideTransition(
                              position: dat.animationProphecyMood,
                              child: prophecyRecord(
                                prophecy: state.prophecy[ProphecyType.MOODLET],
                              ),
                            ),
                          )
                        : SizedBox(),
                    (toShow.ambition)
                        ? Builder(
                            builder: (_) => SlideTransition(
                              position: dat.animationProphecyAmbition,
                              child: prophecyRecord(
                                prophecy: state.prophecy[ProphecyType.AMBITION],
                              ),
                            ),
                          )
                        : SizedBox(),
                    (toShow.intuition)
                        ? Builder(
                            builder: (_) => SlideTransition(
                              position: dat.animationProphecyIntuition,
                              child: prophecyRecord(
                                prophecy:
                                    state.prophecy[ProphecyType.INTUITION],
                              ),
                            ),
                          )
                        : SizedBox(),
                    (toShow.luck)
                        ? Builder(
                            builder: (_) => SlideTransition(
                              position: dat.animationProphecyLuck,
                              child: prophecyRecord(
                                prophecy: state.prophecy[ProphecyType.LUCK],
                              ),
                            ),
                          )
                        : SizedBox(),
                    //
                    /// if all prophecies are disabled show internal strength
                    (toShow.internalStrength == false &&
                            toShow.moodlet == false &&
                            toShow.ambition == false &&
                            toShow.intuition == false &&
                            toShow.luck == false)
                        ? Builder(
                            builder: (_) => SlideTransition(
                              position: dat.animationProphecyInternalStr,
                              child: prophecyRecord(
                                prophecy: state
                                    .prophecy[ProphecyType.INTERNAL_STRENGTH],
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),

                //
                prophecySheetDivider(),

                /// planet impact
                ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                        horizontal: PROPHECY_PADDING_HORIZONTAL),
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 18.0,
                          left: 3.0,
                        ),
                        child: TitleWithDescription(
                          title: localeText.impact.capitalize(),
                          notation: localeText.impactHint,
                        ),
                      ),
                      Container(
                        height: 32.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                    " ${localeText.planetImpactName[dat.currentPlanets[false]]} "),
                                SvgPicture.asset(
                                    "assets/icons/${dat.currentPlanets[false]}.svg",
                                    color: AppColors.negativeImpact),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    " ${localeText.planetImpactName[dat.currentPlanets[true]]} "),
                                SvgPicture.asset(
                                    "assets/icons/${dat.currentPlanets[true]}.svg",
                                    color: AppColors.positiveImpact),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
              ],
            ),
          ),
        ],
      );
    } else {
      return Center(
        child: Text("Error"),
      );
    }
  }
}
