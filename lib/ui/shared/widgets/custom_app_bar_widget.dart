import 'package:corelab_app_challenge/blocs/search_bloc.dart';
import 'package:corelab_app_challenge/ui/pages/tabs_page.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/app_snack_bar_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
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
    SearchBloc bloc = Provider.of<SearchBloc>(context);
    return AppBar(
        backgroundColor: isCategoryAppBar ? AppColorsTheme.secondaryColor : AppColorsTheme.primaryColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColorsTheme.whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TabsPage(),
              ),
            );
          },
        ),
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
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                          bloc.addItemHistory();
                        },
                        onSubmitted: (value) => bloc.addItemHistory(),
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
                        decoration: InputDecoration(
                          hintText: 'Buscar',
                          hintStyle: const TextStyle(fontFamily: 'DMSans-Medium', color: AppColorsTheme.greyColor),
                          suffixIcon: InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              bloc.addItemHistory();
                            },
                            child: const Icon(
                              Icons.search,
                              color: AppColorsTheme.primaryColor,
                              size: 24,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
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
