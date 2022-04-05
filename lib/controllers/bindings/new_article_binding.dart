import 'package:get/get.dart';
import 'package:tugas_minggu_5/controllers/new_article_controller.dart';

class NewArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewArticleController());
  }
}
