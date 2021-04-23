import 'screen/index.dart';

class ProphecyIsLoading extends StatelessWidget {
  const ProphecyIsLoading();

  @override
  Widget build(BuildContext context) {
    //
    final prophecySheet = <Widget>[
      TitleWithDescription(
        padding: const EdgeInsets.only(
          left: 3.0,
          bottom: 8.0,
        ),
        title: localeText.yourProphecies.capitalize(),
        notation: localeText.yourPropheciesHint,
      ),
      //

      Center(
        child: SpinKitWave(color: AppColors.accent),
      ),
    ];

    final planetsSheet = <Widget>[
      TitleWithDescription(
        padding: const EdgeInsets.only(
          top: 18.0,
          left: 3.0,
        ),
        title: localeText.impact.capitalize(),
        notation: localeText.impactHint,
      ),
      Container(
        height: 32.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(" ${localeText.planetImpactName['Lilith']} "),
                SvgPicture.asset("assets/icons/Lilith.svg",
                    color: AppColors.textDisabled),
              ],
            ),
            Row(
              children: [
                Text(" ${localeText.planetImpactName['Selene']} "),
                SvgPicture.asset("assets/icons/Selene.svg",
                    color: AppColors.textDisabled),
              ],
            ),
          ],
        ),
      ),
    ];

    final sheetsList = <Widget>[
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
        children: prophecySheet,
      ),

      //
      ProphecySheetDivider(),

      /// planet impact
      ListView(
        shrinkWrap: true,
        padding:
            const EdgeInsets.symmetric(horizontal: PROPHECY_PADDING_HORIZONTAL),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: planetsSheet,
      ),
    ];

    final screenList = <Widget>[
      /// {NAME} {ROLE}
      Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 16.0,
        ),
        child: Text(
          "",
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
          child: Row(
            children: <Widget>[
              SvgPicture.asset("assets/icons/Moon.svg"),
              Text("  ", style: AppTextStyle.normalText),
            ],
          ),
        ),
      ),

      /// Prophecy Sheet
      Container(
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
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: sheetsList,
        ),
      ),
    ];

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      children: screenList,
    );
  }
}
