import 'package:corelab_app_challenge/ui/shared/widgets/app_product_widget.dart';
import 'package:corelab_app_challenge/ui/shared/widgets/custom_app_bar_widget.dart';
import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 24),
            child: Text(
              'Últimos anúncios',
              style: TextStyle(
                fontFamily: 'DMSans-Medium',
                fontSize: 24,
                color: AppColorsTheme.blackColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Text(
              'Hoje',
              style: TextStyle(
                fontFamily: 'DMSans-Medium',
                fontSize: 14,
                color: AppColorsTheme.greyColor,
              ),
            ),
          ),
          AppProductWidget(),
        ],
      ),
    );
  }
}
