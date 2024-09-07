import 'package:corelab_app_challenge/ui/shared/widgets/app_snack_bar_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSearchTap;
  final Function(String)? onChanged;
  final bool autoFocus;
  final bool canRequestFocus;
  final bool isCategoryAppBar;
  final bool? showFilter;
  final TextEditingController? textEditingController;

  const CustomAppBarWidget(
      {super.key,
      this.onSearchTap,
      this.onChanged,
      this.autoFocus = false,
      this.canRequestFocus = true,
      this.isCategoryAppBar = false,
      this.textEditingController,
      this.showFilter});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: isCategoryAppBar ? AppColorsTheme.secondaryColor : AppColorsTheme.primaryColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColorsTheme.whiteColor,
        title: isCategoryAppBar
            ? Text(
                'Categorias',
                style: AppTextStyleTheme.titleTextStyle.copyWith(
                  fontSize: 24,
                  fontFamily: 'DMSans-Medium',
                ),
              )
            : Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      height: 44,
                      decoration: const BoxDecoration(
                        color: AppColorsTheme.secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: TextField(
                        controller: textEditingController,
                        autofocus: autoFocus,
                        canRequestFocus: canRequestFocus,
                        onTap: () {
                          if (textEditingController != null) {
                            textEditingController!.clear();
                          }
                          onSearchTap?.call();
                        },
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
                    ),
                  ),
                  if (showFilter == true) ...[
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () => AppSnackBarWidget.showSnackBar(context, "Em breve"),
                      child: const Text(
                        'Filtros',
                        style: TextStyle(fontSize: 16, fontFamily: 'DMSans-Medium', color: AppColorsTheme.whiteColor),
                      ),
                    ),
                  ]
                ],
              ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
