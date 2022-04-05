import 'package:get/get.dart';
import 'package:tugas_minggu_5/globals/repositories/news_api.dart';
import 'package:tugas_minggu_5/models/news.dart';

class HomeController extends GetxController {
  NewsRepository newsRepository = Get.find<NewsRepository>();

  RxList<NewsModel> listOfNews = <NewsModel>[].obs;
  RxBool isLoading = false.obs, isNoMoreData = false.obs;

  int page = 1;

  void callApi() {
    isLoading.value = true;

    NewsRepository().getApiData(page).then((api) {
      if (api.isEmpty) isNoMoreData.value = true;

      listOfNews.addAll(api);

      isLoading.value = false;
    }).catchError((error, stackTrace) {
      print("Error : $error");
      print("Error : $stackTrace");
    });
  }

  @override
  void onReady() {
    callApi();
    super.onReady();
  }
}
