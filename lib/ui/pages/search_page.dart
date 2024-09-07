import 'package:corelab_app_challenge/blocs/search_bloc.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/custom_app_bar_widget.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/product/app_product_list_widget.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/search/search_item_list_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  final String? category;
  final TextEditingController? textEditingController;
  final bool? autoFocus;
  final bool? showFilter;
  bool? showHistory;

  SearchPage({
    super.key,
    this.category,
    this.textEditingController,
    this.autoFocus,
    this.showFilter,
    this.showHistory,
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
      bloc.loadHistory();
    });
  }

  @override
  void dispose() {
    widget.textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        onChanged: (String value) {
          if (widget.showHistory ?? true) {
            setState(() {
              widget.showHistory = false;
            });
          }
          return bloc.search(value);
        },
        autoFocus: widget.autoFocus ?? true,
        canRequestFocus: true,
        textEditingController: widget.textEditingController,
        onSearchTap: () {
          if (widget.textEditingController != null) {
            setState(() {
              widget.showHistory = true;
            });
            bloc.itemSearchName = '';
          }
        },
        showFilter: widget.showFilter ?? false,
      ),
      body: ListView(
        children: [
          if ((bloc.searchHistoryIemList.isNotEmpty && (bloc.itemSearchName?.isEmpty ?? true)) || (widget.showHistory == true)) ...[
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: SearchItemListWidget(items: bloc.searchHistoryIemList),
            )
          ] else ...[
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
        ],
      ),
    );
  }
}
