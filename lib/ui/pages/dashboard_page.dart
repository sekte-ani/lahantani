import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahantani/controller/dashboard_controller.dart';
import 'package:lahantani/controller/modul_controller.dart';
import 'package:lahantani/theme.dart';
import 'package:lahantani/ui/pages/forum/forum_page.dart';
import 'package:lahantani/ui/pages/modul/modul_page.dart';
import 'package:lahantani/ui/pages/profile/profile_page.dart';

class DashboardPage extends GetView<DashboardController> {
  final DashboardController controller = Get.put(DashboardController());
  final ModulController modulController = Get.put(ModulController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: bgColor,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                ModulPage(),
                ForumPage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 74,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.15),
                  offset: Offset(0, -1),
                  blurRadius: 37,
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: controller.tabIndex,
              onTap: controller.changeTabIndex,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: darkGreyColor,
              selectedItemColor: greenColor,
              backgroundColor: whiteColor,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: font_semiBold.copyWith(
                fontSize: 12,
              ),
              unselectedLabelStyle: font_medium.copyWith(
                fontSize: 12,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      bottom: 3,
                    ),
                    child: Icon(
                      Icons.book,
                      size: 20,
                      color:
                          controller.tabIndex == 0 ? greenColor : darkGreyColor,
                    ),
                  ),
                  label: 'Modul',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      bottom: 3,
                    ),
                    child: Icon(
                      Icons.forum,
                      size: 20,
                      color:
                          controller.tabIndex == 1 ? greenColor : darkGreyColor,
                    ),
                  ),
                  label: 'Forum',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      bottom: 3,
                    ),
                    child: Icon(
                      Icons.account_circle,
                      size: 20,
                      color:
                          controller.tabIndex == 2 ? greenColor : darkGreyColor,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
