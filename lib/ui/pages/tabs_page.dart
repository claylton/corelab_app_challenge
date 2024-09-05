import 'package:corelab_app_challenge/ui/pages/home_page.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/app_icon_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:corelab_app_challenge/ui/utils/data/app_icon_data.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          const HomePage(),
          Container(color: Colors.blue),
          Container(color: AppColorsTheme.primaryColor),
          Container(color: Colors.amber),
          Container(color: Colors.black),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        padding: const EdgeInsets.all(0),
        labelPadding: const EdgeInsets.all(0),
        labelStyle: AppTextStyleTheme.navBarMenuTitle,
        labelColor: AppColorsTheme.primaryColor,
        unselectedLabelColor: AppColorsTheme.greyColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
        indicatorColor: AppColorsTheme.primaryColor,
        tabs: [
          Tab(
            text: 'Home',
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIconWidget(
                  AppIconData.home,
                  size: 32,
                  color: _currentIndex == 0 ? AppColorsTheme.primaryColor : AppColorsTheme.greyColor,
                ),
              ],
            ),
          ),
          Tab(
            text: 'Categorias',
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIconWidget(
                  AppIconData.category,
                  size: 32,
                  color: _currentIndex == 1 ? AppColorsTheme.primaryColor : AppColorsTheme.greyColor,
                ),
              ],
            ),
          ),
          Tab(
            text: 'Anunciar',
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIconWidget(
                  AppIconData.add,
                  size: 32,
                  color: _currentIndex == 2 ? AppColorsTheme.primaryColor : AppColorsTheme.greyColor,
                ),
              ],
            ),
          ),
          Tab(
            text: 'Favoritos',
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIconWidget(
                  AppIconData.favorites,
                  size: 32,
                  color: _currentIndex == 3 ? AppColorsTheme.primaryColor : AppColorsTheme.greyColor,
                ),
              ],
            ),
          ),
          Tab(
            text: 'Contas',
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIconWidget(
                  AppIconData.profile,
                  size: 32,
                  color: _currentIndex == 4 ? AppColorsTheme.primaryColor : AppColorsTheme.greyColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
