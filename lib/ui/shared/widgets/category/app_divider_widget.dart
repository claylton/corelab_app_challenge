import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:flutter/widgets.dart';

class AppDividerWidget extends StatelessWidget {
  const AppDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorsTheme.borderColor,
      height: 1,
      width: double.infinity,
    );
  }
}