import 'common.dart';
import 'package:my_horoskope/theme/app_colors.dart';
import '../../gradient_border_button.dart';

class PredictionCardWithButton extends StatelessWidget {
  final String text;
  final double textFontSize;
  final String buttonText;
  final double buttonTextFontSize;
  final Function onButtonTap;
  final TextStyle customTextStyle;
  final TextStyle customButtonTextStyle;

  const PredictionCardWithButton({
    @required this.text,
    this.textFontSize = 15,
    @required this.buttonText,
    this.buttonTextFontSize = 12,
    @required this.onButtonTap,
    this.customTextStyle,
    this.customButtonTextStyle,
  });

  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/card/card_placeholder.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
        padding: const EdgeInsets.only(
          top: 16.0,
        ),
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Text(
            text,
            style: customTextStyle ??
                TextStyle(
                  fontSize: textFontSize,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.0,
                ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          GradientBorderButton(
            child: Text(
              buttonText,
              style: customButtonTextStyle ??
                  TextStyle(
                    fontSize: buttonTextFontSize,
                    color: AppColors.textPrimary,
                  ),
            ),
            gradient: const LinearGradient(
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
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            onPressed: onButtonTap,
          ),
        ],
      ),
    );
  }
}
