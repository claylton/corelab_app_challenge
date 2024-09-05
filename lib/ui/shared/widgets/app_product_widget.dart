

import 'package:cached_network_image/cached_network_image.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:flutter/widgets.dart';

class AppProductWidget extends StatelessWidget {

  const AppProductWidget({super.key});

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
                    SizedBox(
                      width: MediaQuery.of(context).size.height / 6,
                      child: CachedNetworkImage(imageUrl: 'https://raw.githubusercontent.com/claylton/corelab_app_challenge/main/assets/images/conditioner.png'),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // if (item.discount != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              color: AppColorsTheme.primaryColor,
                            ),
                            child: const Text(
                              // '${item.discount}% OFF',
                              '10% OFF',
                              style: AppTextStyleTheme.promotionTextStyle,
                            ),
                          ),
                        const SizedBox(height: 6),
                        const Text(
                          'Condicionador Ácido Fosfórico 37% - AllPrime',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyleTheme.titleTextStyle,
                        ),
                        const SizedBox(height: 6),
                        // if (item.discount != null)
                        const Text(
                            'R\$ 300,00',
                            style: AppTextStyleTheme.oldPriceTextStyle,
                          ),
                        const Text(
                          'R\$290,90',
                          style: AppTextStyleTheme.priceTextStyle,
                        ),
                        const Text(
                          'Em até 12x de R\$ 249,00',
                          style: AppTextStyleTheme.descriptionTextStyle,
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'NOVO',
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
