import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:my_prophet/theme/app_text_style.dart';

class MenuItemLeadingIcon extends StatelessWidget {
  final IconData icon;
  final String asset;
  final String text;
  final Function onTap;

  const MenuItemLeadingIcon(
      {

      /// icon to use
      this.icon,

      /// path to svg asset to use
      this.asset,

      //
      @required this.text,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final row = <Widget>[
      if (icon != null)
        Icon(
          icon,
          color: AppColors.textPrimary,
          size: 21.0,
        )
      else if (asset != null)
        SvgPicture.asset(
          "assets/icons/$asset.svg",
          color: AppColors.textPrimary,
          height: 18.0,
          width: 18.0,
        ),
      SizedBox(width: 17.1),
      Text(
        text,
        style: AppTextStyle.menuItem,
      ),
    ];

    final item = Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: row,
      ),
    );

    if (onTap != null)
      return TextButton(
        onPressed: onTap,
        child: item,
      );

    return item;
  }
}

class MenuItemFootingIcon extends StatelessWidget {
  final IconData icon;
  final String asset;
  final String text;
  final Function onTap;

  const MenuItemFootingIcon(
      {

      /// icon to use
      this.icon,

      /// path to svg asset to use
      this.asset,

      //
      @required this.text,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final row = <Widget>[
      Text(
        text,
        style: AppTextStyle.menuItem,
      ),
      Expanded(child: SizedBox()),
      if (icon != null)
        Icon(
          icon,
          color: AppColors.textPrimary,
          size: 21.0,
        )
      else if (asset != null)
        SvgPicture.asset(
          "assets/icons/$asset.svg",
          color: AppColors.textPrimary,
          height: 18.0,
          width: 18.0,
        )
    ];

    return TextButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: row,
        ),
      ),
    );
  }
}

class MenuItemRateApp extends StatelessWidget {
  final String text;
  final Function onTap;

  const MenuItemRateApp({
    @required this.text,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTextStyle.menuItem,
              ),
              Expanded(child: SizedBox()),
              const Icon(
                Icons.star,
                color: AppColors.textPrimary,
                size: 21.0,
              ),
              const Icon(
                Icons.star,
                color: AppColors.textPrimary,
                size: 21.0,
              ),
              const Icon(
                Icons.star,
                color: AppColors.textPrimary,
                size: 21.0,
              ),
              const Icon(
                Icons.star,
                color: AppColors.textPrimary,
                size: 21.0,
              ),
              const Icon(
                Icons.star,
                color: AppColors.textPrimary,
                size: 21.0,
              ),
            ],
          ),
        ),
      );
}
