
import 'package:corelab_app_challenge/model/product_model.dart';
import 'package:corelab_app_challenge/services/mocks/mock_products.dart';

class ProductRepository {

  Future<List<ProductItemModel>> get getAll async {
    Map<String, dynamic> response = ProductsMock.json();
    await Future.delayed(const Duration(seconds: 2));
    return (response['data'] as List)
      .map((course) => ProductItemModel.fromJson(course))
      .toList();
  }
}