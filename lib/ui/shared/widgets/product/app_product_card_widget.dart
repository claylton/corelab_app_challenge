import 'package:corelab_app_challenge/model/product_model.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:corelab_app_challenge/ui/utils/money_formatter_utils.dart';
import 'package:flutter/widgets.dart';

class AppProductCardWidget extends StatelessWidget {
  final ProductItemModel product;

  const AppProductCardWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColorsTheme.whiteColor,
        border: Border(
          bottom: BorderSide(color: AppColorsTheme.borderColor, width: 1.8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height / 7,
                      height: MediaQuery.of(context).size.height / 7,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(product.imagePath),
                        ),
                        // color: Theme.of(context).primaryColor,
                        border: Border.all(width: 4.0, color: const Color(0xFFFFFFFF)),
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (product.discount != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              color: AppColorsTheme.primaryColor,
                            ),
                            child: Text(
                              '${product.discount}% OFF',
                              style: AppTextStyleTheme.promotionTextStyle,
                            ),
                          ),
                        const SizedBox(height: 6),
                        Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyleTheme.titleTextStyle,
                        ),
                        const SizedBox(height: 6),
                        if (product.discount != null)
                          Text(
                            MoneyFormatter.format(product.oldPrice),
                            maxLines: 1,
                            style: AppTextStyleTheme.oldPriceTextStyle,
                          ),
                        Text(
                          MoneyFormatter.format(product.price),
                          maxLines: 1,
                          style: AppTextStyleTheme.priceTextStyle,
                        ),
                        Text(
                          product.parcelsInfo,
                          maxLines: 1,
                          style: AppTextStyleTheme.descriptionTextStyle,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          product.productState,
                          maxLines: 1,
                          style: AppTextStyleTheme.itemStateTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
