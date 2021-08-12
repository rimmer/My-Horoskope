import 'common.dart';

class AddAmbianceButton extends StatelessWidget {
  final Function onTap;
  const AddAmbianceButton({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBorderButton(
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
      onPressed: onTap,
    );
  }
}
