part of '../screen.dart';

extension DailyScreenNotAvaibleButton on _DailyScreenState {
  Widget notAvailableButton() => NotAvaibleInfo(
        height: 242,
        width: 250,
        child: gradientBorderButton(
          child: Text(
            localeText.addAmbiance.toUpperCase(),
            style: AppTextStyle.normalText,
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.accentDark,
              AppColors.accent,
              AppColors.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderAsPadding: EdgeInsets.all(1.0),
          background: AppColors.primaryDark,
          internalPadding: EdgeInsets.symmetric(horizontal: 38, vertical: 12.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          onPressed: null,
        ),
        title: localeText.noAmbianceTitle.capitalize(),
        desc: localeText.noAmbianceDescription,
        button: localeText.noAmbianceButton.toUpperCase(),
      );
}
