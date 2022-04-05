import 'package:get/get.dart';
import 'package:tugas_minggu_5/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
