import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:flutter/material.dart';

class CategoryItemWidgets extends StatelessWidget {
  final String categoryName;
  final VoidCallback onTap;

  const CategoryItemWidgets({
    super.key,
    required this.categoryName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Text(
            categoryName,
            maxLines: 1,
            style: AppTextStyleTheme.categoryTitle,
          ),
        ),
      ),
    );
  }
}
