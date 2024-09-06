import 'package:corelab_app_challenge/model/product_model.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/loader_widget.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/product/app_product_card_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:corelab_app_challenge/ui/utils/formatters/datetime_formatter_utils.dart';
import 'package:flutter/widgets.dart';

class AppProductListWidget extends StatelessWidget {
  final List<ProductItemModel>? products;

  const AppProductListWidget({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: LoaderWidget(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: products?.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        bool isFirstItem = index == 0;
        bool isDifferentDate = index > 0 && products![index].createdAt.day != products![index - 1].createdAt.day;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (isFirstItem || isDifferentDate)
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  DateTimeFormatterUtils.getFormattedDateDateTime(products![index].createdAt),
                  style: const TextStyle(
                    fontFamily: 'DMSans-Medium',
                    fontSize: 14,
                    color: AppColorsTheme.greyColor,
                  ),
                ),
              )
              : const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: AppProductCardWidget(
                product: products![index],
              ),
            ),
          ],
        );
      },
    );
  }
}
