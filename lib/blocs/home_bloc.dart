import 'package:corelab_app_challenge/model/product_model.dart';
import 'package:corelab_app_challenge/services/repositories/product_repository.dart';
import 'package:flutter/widgets.dart';

class HomeBloc extends ChangeNotifier {
  final ProductRepository productRepository = ProductRepository();

  List<ProductItemModel>? products;
  List<ProductItemModel>? todayProducts;
  List<ProductItemModel>? yesterdayProducts;

  HomeBloc() {
    getAllProducts;
    getAllTodayProducts();
    getAllYesterdayProducts();
  }

  get getAllProducts => productRepository.getAll.then((data) => products = data).then((_) => notifyListeners());

  getAllTodayProducts() {
    productRepository.getAll.then((data) {
      todayProducts = data.where((item) {
        return item.createdAt.day == DateTime.now().day;
      }).toList();
      notifyListeners();
    });
  }

  getAllYesterdayProducts() {
    productRepository.getAll.then((data) {
      yesterdayProducts = data.where((item) {
        return item.createdAt.day == (DateTime.now().subtract(const Duration(days: 1))).day;
      }).toList();
      notifyListeners();
    });
  }
}
