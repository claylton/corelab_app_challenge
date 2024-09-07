import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:flutter/material.dart';

class SearchItemWidget extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const SearchItemWidget({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.history,
                color: AppColorsTheme.greyColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  maxLines: 1,
                  name,
                  style: AppTextStyleTheme.itemStateTextStyle.copyWith(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
