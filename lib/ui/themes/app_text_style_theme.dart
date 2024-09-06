import 'package:flutter/widgets.dart';
import 'app_colors_theme.dart';

abstract class AppTextStyleTheme {
  static const TextStyle navBarMenuTitle = TextStyle(
    color: AppColorsTheme.primaryColor,
    fontSize: 10,
    fontFamily: 'DMSans-Regular',
  );

  static const TextStyle titleTextStyle = TextStyle(
    color: AppColorsTheme.blackColor,
    fontSize: 16,
    fontFamily: 'DMSans-VariableFont',
  );

  static const TextStyle promotionTextStyle = TextStyle(
    color: AppColorsTheme.whiteColor,
    fontSize: 10.5,
    fontFamily: 'DMSans-Bold',
  );

  static const TextStyle oldPriceTextStyle = TextStyle(
    color: AppColorsTheme.greyColor,
    fontSize: 14,
    fontFamily: 'DMSans-Medium',
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColorsTheme.greyColor,
  );

  static const TextStyle priceTextStyle = TextStyle(
    color: AppColorsTheme.blackColor,
    fontSize: 20,
    fontFamily: 'DMSans-Medium',
  );

  static const TextStyle descriptionTextStyle = TextStyle(
    color: AppColorsTheme.primaryColor,
    fontSize: 14,
    fontFamily: 'DMSans-Light',
  );

  static const TextStyle itemStateTextStyle = TextStyle(
    color: AppColorsTheme.greyColor,
    fontSize: 12,
    fontFamily: 'DMSans-Medium',
  );

  static const TextStyle categoryTitle = TextStyle(
    color: AppColorsTheme.primaryColor,
    fontSize: 20,
    fontFamily: 'DMSans-Regular',
  );
}
