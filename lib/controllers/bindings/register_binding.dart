import 'package:get/get.dart';
import 'package:tugas_minggu_5/controllers/regist_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistController());
  }
}
