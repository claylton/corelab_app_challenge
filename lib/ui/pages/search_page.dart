import 'package:corelab_app_challenge/blocs/search_bloc.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/custom_app_bar_widget.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/product/app_product_list_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchBloc bloc = Provider.of<SearchBloc>(context);

    return Scaffold(
      appBar: CustomAppBarWidget(
        onChanged: (String value) => bloc.search(value),
        autoFocus: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 24),
            child: Text(
              bloc.isLoading
              ? 'Aguarde..'
              : '${bloc.searchResults?.length} resultados encontrados',
              style: const TextStyle(
                fontFamily: 'DMSans-Medium',
                // fontSize: 24,
                color: AppColorsTheme.blackColor,
              ),
            ),
          ),
          AppProductListWidget(products: bloc.searchResults),
        ],
      ),
    );
  }
}