import 'package:get/get.dart';
import 'package:tugas_minggu_5/controllers/home_controller.dart';
import 'package:tugas_minggu_5/controllers/login_controller.dart';
import 'package:tugas_minggu_5/controllers/new_article_controller.dart';
import 'package:tugas_minggu_5/controllers/profile_controller.dart';
import 'package:tugas_minggu_5/controllers/regist_controller.dart';
import 'package:tugas_minggu_5/globals/repositories/news_api.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NewsRepository());
    Get.lazyPut(() => NewArticleController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => LoginController());
  }
}
