import 'common.dart';

class AddAmbianceButton extends StatelessWidget {
  final Function onTap;
  const AddAmbianceButton({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientFlatButton(
      child: Text(
        localeText.addAmbiance.toUpperCase(),
        style: AppTextStyle.normalText,
      ),
      gradient: LinearGradient(
        colors: [
          AppColors.accent,
          AppColors.accentDark,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 16.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
      onPressed: onTap,
    );
  }
}
