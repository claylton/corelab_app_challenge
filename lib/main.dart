import 'package:corelab_app_challenge/blocs/home_bloc.dart';
import 'package:corelab_app_challenge/ui/pages/tabs_page.dart';
import 'package:corelab_app_challenge/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(value: HomeBloc()),
      ],
      child: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Corelab App Challenge',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const DefaultTabController(
          length: 5,
          child: TabsPage(),
        ));
  }
}
