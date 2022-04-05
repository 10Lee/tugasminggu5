import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tugas_minggu_5/controllers/profile_controller.dart';
import 'package:tugas_minggu_5/routes/app_router.dart';
import 'package:tugas_minggu_5/controllers/home_controller.dart';
import 'package:tugas_minggu_5/views/widgets/category.dart';

class Home extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();

  late HomeController homeController;

  @override
  Widget build(BuildContext context) {
    homeController = Get.find<HomeController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.toNamed(AppRouter.urlProfile);
              },
              icon: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: Obx(
        () => NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
              if (!homeController.isNoMoreData.value) {
                if (!homeController.isLoading.value) {
                  homeController.page++;
                  homeController.callApi();
                }
              }
            }
            return true;
          },
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: .8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        width: .8,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        _searchController.text = "";
                      },
                      child: Icon(
                        Icons.close,
                        size: 30.0,
                      ),
                    ),
                    hintText: "Search for news",
                  ),
                ),
              ),
              NewsCategory(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Latest News',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  homeController.listOfNews.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 160.0),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : _buildLatestNews(),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRouter.urlAddArticle),
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  _buildLatestNews() {
    List<Widget> listOfWidgetNews = [];

    for (int i = 0;
        i <
            (homeController.isNoMoreData.value
                ? homeController.listOfNews.length
                : homeController.listOfNews.length + 1);
        i++) {
      if (i < homeController.listOfNews.length) {
        final data = homeController.listOfNews[i];

        listOfWidgetNews.add(
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  child: Image(
                    width: 100.0,
                    height: 100.0,
                    image: NetworkImage(data.imageUrl.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                data.source.toString(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.purple[300],
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.MMMMEEEEd()
                                  .format(data.publishedAt)
                                  .toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 9.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          data.title.toString(),
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          data.description.toString(),
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        listOfWidgetNews.add(Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(child: CircularProgressIndicator()),
        ));
      }
    }

    return Column(children: listOfWidgetNews);
  }
}
