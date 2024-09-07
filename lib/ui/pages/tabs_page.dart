import 'package:corelab_app_challenge/ui/pages/category_page.dart';
import 'package:corelab_app_challenge/ui/pages/home_page.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/app_icon_widget.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/app_snack_bar_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:corelab_app_challenge/ui/themes/app_text_style_theme.dart';
import 'package:corelab_app_challenge/ui/utils/data/app_icon_data_utils.dart';
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
          CategoryPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        onTap: (index) {
          if (index > 1) {
            _tabController.index = _tabController.previousIndex;
            _currentIndex = index;
            AppSnackBarWidget.showSnackBar(context, "Em breve :D");
          } else {
            return;
          }
        },
        controller: _tabController,
        padding: const EdgeInsets.all(0),
        labelPadding: const EdgeInsets.all(0),
        labelStyle: AppTextStyleTheme.navBarMenuTitle,
        labelColor: _currentIndex > 1 ? AppColorsTheme.greyColor : AppColorsTheme.primaryColor,
        unselectedLabelColor: AppColorsTheme.greyColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
        indicatorColor: _currentIndex > 1 ? AppColorsTheme.whiteColor : AppColorsTheme.primaryColor,
        tabs: [
          Tab(
            text: 'Home',
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIconWidget(
                  _currentIndex == 0 ? AppIconDataUtils.homeSelect : AppIconDataUtils.home,
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
                  _currentIndex == 1 ? AppIconDataUtils.categorySelect : AppIconDataUtils.category,
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
                  AppIconDataUtils.add,
                  size: 32,
                  color: AppColorsTheme.greyColor,
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
                  AppIconDataUtils.favorites,
                  size: 32,
                  color: AppColorsTheme.greyColor,
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
                  AppIconDataUtils.profile,
                  size: 32,
                  color: AppColorsTheme.greyColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
