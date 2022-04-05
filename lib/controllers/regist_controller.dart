import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
    pref = await SharedPreferences.getInstance();

    pref.setString('name', nameController.text);
    pref.setString('city', cityController.text);
    pref.setString('pass', passController.text);
    pref.setString('confirmpass', confirmPassController.text);

    Get.offAllNamed(AppRouter.urlHome);
  }
}
