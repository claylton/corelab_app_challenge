import 'package:corelab_app_challenge/ui/pages/tabs_page.dart';
import 'package:corelab_app_challenge/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const DefaultTabController(
          length: 5,
          child: TabsPage(),
        ));
  }
}
