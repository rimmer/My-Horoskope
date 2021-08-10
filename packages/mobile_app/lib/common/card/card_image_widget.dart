
import 'package:flutter/widgets.dart';
import 'package:jovial_svg/jovial_svg.dart';

class CardImageWidget extends StatelessWidget {
  final ScalableImage scalableImage;

  CardImageWidget(this.scalableImage);

  @override
  Widget build(BuildContext context) {
    return ScalableImageWidget(
        si: scalableImage
    );
  }

}