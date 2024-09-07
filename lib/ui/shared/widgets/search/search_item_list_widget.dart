import 'package:corelab_app_challenge/ui/shared/widgets/search/search_item_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:flutter/material.dart';

class SearchItemListWidget extends StatelessWidget {
  final List<String> items;

  const SearchItemListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pesquisas recentes',
          style: AppTextStyleTheme.notFoundTitle.copyWith(fontFamily: 'DMSans-Medium', fontSize: 16),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchItemWidget(
                  name: items[index],
                  onTap: () {},
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
