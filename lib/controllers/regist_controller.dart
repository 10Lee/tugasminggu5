import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_minggu_5/routes/app_router.dart';

class RegistController extends GetxController {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  late SharedPreferences pref;

  void saveAccount() async {
    Map<String, dynamic> user = {
      "name": nameController.text,
      "city": cityController.text,
      "pass": passController.text,
      "confirm": confirmPassController.text,
    };

    GetStorage()
        .write('user', user)
        .then((value) => Get.offAllNamed(AppRouter.urlHome));
  }
}
