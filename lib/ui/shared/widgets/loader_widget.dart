import 'package:corelab_app_challenge/ui/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final dynamic object;
  final Function callback;

  const LoaderWidget({ super.key, required this.object, required this.callback });

   @override
   Widget build(BuildContext context) {
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
       return callback();
  }
}