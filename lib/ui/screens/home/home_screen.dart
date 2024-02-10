import 'package:flutter/material.dart';
import 'package:islami_sun_c10/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_sun_c10/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_sun_c10/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_sun_c10/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_sun_c10/ui/utils/app_assets.dart';
import 'package:islami_sun_c10/ui/utils/app_colors.dart';
import 'package:islami_sun_c10/ui/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  Widget body = QuranTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.background))),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigation(),
        body: body,
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Islami",
          style: AppTheme.appBarTextStyle,
        ),
      );

  Widget buildBottomNavigation() => Theme(
        data: ThemeData(canvasColor: AppColors.orange),
        child: BottomNavigationBar(
          backgroundColor: AppColors.orange,
          items: [
            buildBottomNavigationBarItem(AppAssets.icQuran, "Quran"),
            buildBottomNavigationBarItem(AppAssets.icAhadeth, "Ahadeth"),
            buildBottomNavigationBarItem(AppAssets.icSebha, "Sebha"),
            buildBottomNavigationBarItem(AppAssets.icRadio, "Radio"),
          ],
          selectedItemColor: AppColors.lightBlack,
          currentIndex: currentTabIndex,
          onTap: (index) {
            currentTabIndex = index;
            if (currentTabIndex == 0) {
              body = QuranTab();
            } else if (currentTabIndex == 1) {
              body = AhadethTab();
            } else if (currentTabIndex == 2) {
              body = SebhaTab();
            } else {
              body = RadioTab();
            }
            setState(() {});
          },
        ),
      );

  BottomNavigationBarItem buildBottomNavigationBarItem(
          String imagePath, String label) =>
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(imagePath),
            size: 32,
          ),
          label: label);
}
