import 'package:corelab_app_challenge/ui/pages/search_page.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/category/app_divider_widget.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/category/category_items_widgets.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/custom_app_bar_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  CategoryPage({super.key});

  final List<String> categories = [
    "Anestésicos e Agulhas Gengival",
    "Biossegurança",
    "Descartáveis",
    "Dentística e Estética",
    "Ortodontia",
    "Endodontia",
    "Periféricos e Peças de Mão",
    "Moldagem",
    "Prótese",
    "Cimentos",
    "Instrumentos",
    "Cirurgia e Periodontia",
    "Radiologia"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(isCategoryAppBar: true),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColorsTheme.whiteColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: AppColorsTheme.borderColor),
              ),
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final item = categories[index];
                return CategoryItemWidgets(
                  categoryName: item,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(
                          category: item,
                          textEditingController: TextEditingController(text: 'categoria: $item'),
                          autoFocus: false,
                          showFilter: true,
                          showHistory: false,
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(left: 20),
                child: AppDividerWidget(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
