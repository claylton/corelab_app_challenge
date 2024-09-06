// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:corelab_app_challenge/model/product_model.dart';
import 'package:corelab_app_challenge/services/repositories/product_repository.dart';
import 'package:corelab_app_challenge/ui/utils/formatters/regex_formatter_utils.dart';
import 'package:flutter/widgets.dart';

class SearchBloc extends ChangeNotifier {
  final ProductRepository productRepository = ProductRepository();

  List<ProductItemModel>? searchResults;
  final TextEditingController? word;
  bool isLoading = false;

  SearchBloc({this.word}) {
    search(word?.text ?? '');
  }

  search(String word) {
    isLoading = true;
    notifyListeners();

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
}
