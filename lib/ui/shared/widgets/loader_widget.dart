import 'package:corelab_app_challenge/blocs/search_bloc.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoaderWidget extends StatelessWidget {
  final dynamic object;
  final Function callback;

  const LoaderWidget({ super.key, required this.object, required this.callback });

   @override
   Widget build(BuildContext context) {
    final SearchBloc bloc = Provider.of<SearchBloc>(context);
    
    if (object == null) {
      return const Center(
        child: ProgressIndicatorWidget(),
      );
    }
    if (object.length == 0) {
      return const Center(
        child: Text("Nenhum item encontrado"),
      );
    }

    if (bloc.isLoading) {
      return const Center(
        child: ProgressIndicatorWidget(),
      );
    }
       return callback();
  }
}