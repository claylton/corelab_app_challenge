import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSearchTap;
  final Function(String)? onChanged;
  final bool autoFocus;


  const CustomAppBarWidget({
    super.key,
    this.onSearchTap, 
    this.onChanged,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColorsTheme.primaryColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColorsTheme.whiteColor,
        title: Container(
          margin: const EdgeInsets.only(top: 8),
          height: 44,
          decoration: const BoxDecoration(
            color: AppColorsTheme.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: TextField(
            autofocus: autoFocus,
            canRequestFocus: autoFocus,
            onTap: onSearchTap,
            onChanged: onChanged,
            showCursor: true,
            cursorColor: AppColorsTheme.greyColor,
            style: AppTextStyleTheme.titleTextStyle,
            decoration: const InputDecoration(
              hintText: 'Buscar',
              hintStyle: TextStyle(fontFamily: 'DMSans-Medium', color: AppColorsTheme.greyColor),
              suffixIcon: Icon(Icons.search, color: AppColorsTheme.primaryColor, size: 24),
              contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),
              border: InputBorder.none,
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
