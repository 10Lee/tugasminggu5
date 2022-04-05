import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_minggu_5/routes/app_router.dart';

class ProfileController extends GetxController {
  String name = '', city = '';

  late SharedPreferences pref;

  void getData() async {
    pref = await SharedPreferences.getInstance();
    name = pref.getString('name') ?? 'No Name';
    city = pref.getString('city') ?? 'No City';

    update();
  }

  void logout() {
    pref.clear();
    print("Session has been deleted");
    Get.offAllNamed(AppRouter.urlRegister);
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }
}
