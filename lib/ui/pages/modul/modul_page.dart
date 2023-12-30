import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lahantani/controller/dashboard_controller.dart';
import 'package:lahantani/controller/modul_controller.dart';
import 'package:lahantani/controller/profile_controller.dart';
import 'package:lahantani/theme.dart';
import 'package:lahantani/ui/pages/modul/modul_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as path;

class ModulPage extends GetView<DashboardController> {
  ModulController modulController = Get.put(ModulController());
  ProfileController profileController = Get.put(ProfileController());

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "can not launch url";
    }
    ;
  }

  Future<void> _onRefresh() async {
    await modulController.getModuls();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    var dataProfile = profileController.profile;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: greenColor,
          toolbarHeight: 80,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Hi,',
                    style: font_semiBold.copyWith(
                      fontSize: 22,
                      color: whiteColor,
                    ),
                  ),
                  Obx(() => Text(
                        '${dataProfile["name"]}',
                        style: font_medium.copyWith(
                          fontSize: 18,
                          color: whiteColor,
                        ),
                      )),
                ],
              ),
              GestureDetector(
                onTap: () {
                  controller.changeTabIndex(2);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.account_circle,
                    size: 70.0,
                    color: Colors.white, // Optionally set the icon color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "List Modul",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: Obx(() => ListView.builder(
                      itemCount: modulController.moduls.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = modulController.moduls[index];
                        return InkWell(
                          onTap: () {
                            print('Card Clicked: ${item["modul"]}');
                            String urlnya = "${item["modul"]}";
                            // int startIndex = "post-file/".length;
                            // String urlModul = prefix.substring(startIndex);
                            String extension = path.extension(urlnya);

                            var modulUrl =
                                'https://tani.ferdirns.com/storage/${item["modul"]}';
                            if (extension == ".pdf") {
                              Get.to(() => ModulDetailPage(pdfUrl: modulUrl));
                              // _launchURL(modulUrl);
                            } else {
                              print("${modulUrl}");
                              _launchURL(modulUrl);
                            }
                          },
                          child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[300],
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.book,
                                        size: 40,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item["title"],
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          item["created_at"],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Klik untuk membuka modul...',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
