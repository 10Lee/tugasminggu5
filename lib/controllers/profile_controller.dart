import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tugas_minggu_5/routes/app_router.dart';

class ProfileController extends GetxController {
  RxString name = ''.obs;
  RxString city = ''.obs;

  void getData() {
    Map<String, dynamic> data = GetStorage().read('user');
    name.value = data["name"] ?? 'No Name';
    city.value = data["city"] ?? 'No City';
  }

  void logout() {
    // pref.clear();
    GetStorage().remove('user');
    print("Session has been deleted");
    Get.offAllNamed(AppRouter.urlRegister);
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }
}
