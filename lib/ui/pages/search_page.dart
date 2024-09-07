import 'package:corelab_app_challenge/blocs/search_bloc.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/custom_app_bar_widget.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/product/app_product_list_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final String? category;
  final TextEditingController? textEditingController;
  final VoidCallback? onSearchTap;
  final bool? autoFocus;
  final bool? showFilter;

  const SearchPage({
    super.key,
    this.category,
    this.textEditingController,
    this.onSearchTap,
    this.autoFocus,
    this.showFilter,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<SearchBloc>(context);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.category != null) {
        bloc.searchByCategory(widget.category!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        onChanged: (String value) => bloc.search(value),
        autoFocus: widget.autoFocus ?? true,
        canRequestFocus: true,
        textEditingController: widget.textEditingController,
        onSearchTap: widget.onSearchTap,
        showFilter: widget.showFilter ?? false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 24),
            child: Text(
              bloc.isLoading 
              ? 'Aguarde..' 
              : bloc.searchResults!.isEmpty
                ? ''
                : '${bloc.searchResults?.length} resultados encontrados',
              style: const TextStyle(
                fontFamily: 'DMSans-Medium',
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
