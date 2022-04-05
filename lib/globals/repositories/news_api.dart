import 'package:get/get.dart';
import 'package:tugas_minggu_5/models/news.dart';
import 'package:tugas_minggu_5/globals/api_const.dart';

class NewsRepository extends GetConnect {
  Future<List<NewsModel>> getApiData(int page) async {
    var response = await get(Constant.url + "&page=$page");

    if (response.statusCode == 200) {
      List<dynamic> articles = response.body['articles'];
      List<NewsModel> listOfNewsModel =
          articles.map((data) => NewsModel.fromMap(data)).toList();
      return listOfNewsModel;
    } else {
      throw Exception();
    }
  }

  Future<Map<String, dynamic>> postForm({
    required String title,
    required String description,
    required String imageUrl,
    required String content,
    required String source,
  }) async {
    var response = await post(Constant.postBaseUrl + '/posts', {
      "title": title,
      "description": description,
      "imageUrl": imageUrl,
      "content": content,
      "source": source,
    });
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception();
    }
  }
}
