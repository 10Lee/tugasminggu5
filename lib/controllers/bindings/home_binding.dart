import 'package:get/get.dart';
import 'package:tugas_minggu_5/controllers/home_controller.dart';
import 'package:tugas_minggu_5/globals/repositories/news_api.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NewsRepository());
  }
}
