import 'package:flutter/material.dart';
import 'package:app/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';

GestureDetector menuItemLeadingIcon(
        {IconData icon,
        String asset,
        @required String text,
        @required Function onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            (icon != null)
                ? Icon(
                    icon,
                    color: AppColors.textPrimary,
                    size: 19.0,
                  )
                : (asset != null)
                    ? SvgPicture.asset(
                        "assets/icons/$asset.svg",
                        color: AppColors.textPrimary,
                        height: 16.0,
                        width: 16.0,
                      )
                    : SizedBox(),
            SizedBox(width: 17.1),
            Text(text,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                )),
          ],
        ),
      ),
    );

GestureDetector menuItemFootingIcon(
        {IconData icon,
        String asset,
        @required String text,
        @required Function onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(text,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                )),
            Expanded(child: SizedBox()),
            (icon != null)
                ? Icon(
                    icon,
                    color: AppColors.textPrimary,
                    size: 19.0,
                  )
                : (asset != null)
                    ? SvgPicture.asset(
                        "assets/icons/$asset.svg",
                        color: AppColors.textPrimary,
                        height: 16.0,
                        width: 16.0,
                      )
                    : SizedBox(),
          ],
        ),
      ),
    );

GestureDetector menuItemRateApp(
        {@required String text, @required Function onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                )),
            Expanded(child: SizedBox()),
            Icon(
              Icons.star,
              color: AppColors.textPrimary,
              size: 19.0,
            ),
            Icon(
              Icons.star,
              color: AppColors.textPrimary,
              size: 19.0,
            ),
            Icon(
              Icons.star,
              color: AppColors.textPrimary,
              size: 19.0,
            ),
            Icon(
              Icons.star,
              color: AppColors.textPrimary,
              size: 19.0,
            ),
            Icon(
              Icons.star,
              color: AppColors.textPrimary,
              size: 19.0,
            ),
          ],
        ),
      ),
    );
