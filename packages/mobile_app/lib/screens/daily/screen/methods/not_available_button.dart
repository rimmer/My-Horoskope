part of '../screen.dart';

class NotAvailableButton extends StatelessWidget {
  const NotAvailableButton();
  @override
  Widget build(BuildContext context) => NotAvaibleInfo(
        child: GradientBorderButton(
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
          borderAsPadding: const EdgeInsets.all(1.0),
          background: AppColors.primaryDark,
          internalPadding:
              const EdgeInsets.symmetric(horizontal: 38, vertical: 12.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          onPressed: null,
        ),
        title: localeText.noAmbianceTitle.capitalize(),
        desc: localeText.noAmbianceDescription,
        button: localeText.noAmbianceButton.toUpperCase(),
      );
}
