import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tugas_minggu_5/controllers/regist_controller.dart';
import 'package:tugas_minggu_5/globals/style.dart';
import 'package:tugas_minggu_5/routes/app_router.dart';
import 'package:tugas_minggu_5/controllers/login_controller.dart';
import 'package:tugas_minggu_5/views/widgets/input_fields.dart';
import 'package:tugas_minggu_5/views/widgets/my_richtext.dart';
import 'package:tugas_minggu_5/views/widgets/password_field.dart';

class LoginView extends StatelessWidget {
  late LoginController loginController;

  @override
  Widget build(BuildContext context) {
    loginController = Get.find<LoginController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          color: Colors.pink,
          child: Center(
            child: ListView(
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: kHeadingTextWhite,
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20.0),
                  width: double.infinity,
                  child: Form(
                    key: loginController.globalKey,
                    child: Column(
                      children: [
                        RegularInputWidget(
                          controller: loginController.nameController,
                          valid: "Name must be filled",
                          label: "Name",
                          decorate: kInputDecoration.copyWith(
                            fillColor: Colors.pinkAccent,
                            hintText: "Enter your name",
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        PassInputWidget(
                          controller: loginController.passController,
                          label: "Password",
                          valid: "Password field must be filled",
                          decorate: kInputDecoration.copyWith(
                            fillColor: Colors.pinkAccent,
                            hintText: "Enter your password",
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        InkWell(
                          onTap: () {
                            if (loginController.globalKey.currentState!
                                .validate()) {
                              loginController.validateLogin();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Center(
                              child: Text(
                                'Login now',
                                style: kTitleTextWhite.copyWith(
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        MyRichText(
                          describe: 'Don\'t have an account? ',
                          linkText: 'Click here',
                          link: () {
                            Get.lazyPut(() => RegistController());
                            Get.offAllNamed(AppRouter.urlRegister);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
