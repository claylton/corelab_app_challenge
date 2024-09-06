import 'package:corelab_app_challenge/model/product_model.dart';
import 'package:corelab_app_challenge/services/repositories/product_repository.dart';
import 'package:flutter/widgets.dart';

class HomeBloc extends ChangeNotifier {
  final ProductRepository productRepository = ProductRepository();

  List<ProductItemModel>? products;

  HomeBloc() {
    getProducts;
  }

  get getProducts => productRepository.getAll.then((data) => products = data).then((_) => notifyListeners());

}
