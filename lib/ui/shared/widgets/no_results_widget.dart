import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotResultsWidget extends StatelessWidget {
  final String? itemSearchName;
  final String svgPath;
  final double svgHeight;
  final double svgWidth;

  const NotResultsWidget({
    super.key,
    this.itemSearchName,
    this.svgPath = 'assets/images/not_found.svg',
    this.svgHeight = 200.0,
    this.svgWidth = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
            height: svgHeight,
            width: svgWidth,
            fit: BoxFit.contain,
            semanticsLabel: 'Nenhum resultado encontrado',
          ),
          const SizedBox(height: 16),
          const Text(
            'Resultado não encontrado',
            style: AppTextStyleTheme.notFoundTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Não encontramos nenhum resultado parecido com "$itemSearchName".',
            style: AppTextStyleTheme.notFoundSubtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
