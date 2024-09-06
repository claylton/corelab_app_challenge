import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:corelab_app_challenge/ui/utils/data/app_icon_data_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconWidget extends StatelessWidget {
  final AppIconDataUtils icon;
  final Color? color;
  final double size;
  const AppIconWidget(this.icon, {super.key, this.color, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon.toString(),
      colorFilter: ColorFilter.mode(color ?? AppColorsTheme.primaryColor, BlendMode.srcIn),
      height: size,
      width: size,
    );
  }
}