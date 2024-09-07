import 'package:corelab_app_challenge/model/product_model.dart';
import 'package:corelab_app_challenge/services/repositories/product_repository.dart';
import 'package:corelab_app_challenge/ui/utils/formatters/regex_formatter_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBloc extends ChangeNotifier {
  final ProductRepository productRepository = ProductRepository();
  final TextEditingController? word;

  List<ProductItemModel>? searchResults;
  bool isLoading = false;
  String? itemSearchName;

  SearchBloc({this.word}) {
    search(word?.text ?? '');
  }

  search(String word) {
    isLoading = true;
    notifyListeners();

    itemSearchName = word;
    String wordFormatter = RegexFormatterUtils.removeAccents(word).toLowerCase();

    productRepository.getAll.then((data) {
      searchResults = data.where((item) {
        String itemTitleFormatter = RegexFormatterUtils.removeAccents(item.title).toLowerCase();

        isLoading = false;
        notifyListeners();

        return itemTitleFormatter.contains(wordFormatter) || item.price.toString().toLowerCase().contains(wordFormatter);
      }).toList();
      notifyListeners();
    });
  }

  searchByCategory(String word) async {
    isLoading = true;
    notifyListeners();

    itemSearchName = word;
    String wordFormatter = RegexFormatterUtils.removeAccents(word).toLowerCase();

    try {
      final data = await productRepository.getAll;
      searchResults = data.where((item) {
        String itemCategoryFormatter = RegexFormatterUtils.removeAccents(item.category).toLowerCase();

        return itemCategoryFormatter.contains(wordFormatter);
      }).toList();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
