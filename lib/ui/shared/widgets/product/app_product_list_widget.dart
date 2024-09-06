import 'package:corelab_app_challenge/model/product_model.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/loader_widget.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/product/app_product_card_widget.dart';
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
      height: 410,
      child: LoaderWidget(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: products?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: AppProductCardWidget(
            product: products![index],
          ),
        );
      },
    );
  }
}