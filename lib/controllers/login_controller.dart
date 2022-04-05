import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_minggu_5/controllers/regist_controller.dart';
import 'package:tugas_minggu_5/routes/app_router.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late SharedPreferences pref;

  String name = '', pass = '';

  void getDataToForm() async {
    pref = await SharedPreferences.getInstance();

    name = pref.getString('name') ?? 'no name';
    pass = pref.getString('pass') ?? 'no pass';

    print("$name $pass");
  }

  void validateLogin() async {
    pref = await SharedPreferences.getInstance();

    if (name == nameController.text && pass == passController.text) {
      print('login success');
      Get.offAllNamed(AppRouter.urlHome);
    } else {
      print('login failed');
      Get.defaultDialog(
          title: "Not Match",
          middleText: "You input data that doesn't match of any account",
          textConfirm: "Try again?",
          onConfirm: () {
            nameController.text = '';
            passController.text = '';
            Get.back();
          },
          textCancel: "Register Now?",
          onCancel: () {
            Get.lazyPut(() => RegistController());
            Get.offAllNamed(AppRouter.urlRegister);
          });
    }
  }

  @override
  void onReady() {
    getDataToForm();
    super.onReady();
  }
}
