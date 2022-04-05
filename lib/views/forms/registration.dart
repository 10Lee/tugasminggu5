import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tugas_minggu_5/controllers/login_controller.dart';
import 'package:tugas_minggu_5/globals/style.dart';
import 'package:tugas_minggu_5/controllers/regist_controller.dart';
import 'package:tugas_minggu_5/routes/app_router.dart';
import 'package:tugas_minggu_5/views/widgets/input_fields.dart';
import 'package:tugas_minggu_5/views/widgets/my_richtext.dart';
import 'package:tugas_minggu_5/views/widgets/password_field.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RegistController regController = Get.find<RegistController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          color: Colors.purple,
          child: Center(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Center(
                  child: Text(
                    'Register',
                    style: kHeadingTextWhite,
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 20.0,
                  ),
                  width: double.infinity,
                  child: Form(
                    key: regController.globalKey,
                    child: Column(
                      children: [
                        RegularInputWidget(
                          controller: regController.nameController,
                          valid: "Name field must be filled",
                          label: "Name",
                          decorate: kInputDecoration.copyWith(
                            fillColor: Colors.purpleAccent,
                            hintText: "Enter your name",
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        RegularInputWidget(
                          controller: regController.cityController,
                          valid: "City field must be filled",
                          label: "City",
                          decorate: kInputDecoration.copyWith(
                            fillColor: Colors.purpleAccent,
                            hintText: "Enter where you live",
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        PassInputWidget(
                          controller: regController.passController,
                          valid: "Password field must be filled",
                          label: "Password",
                          decorate: kInputDecoration.copyWith(
                            fillColor: Colors.purpleAccent,
                            hintText: "Enter where you password",
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Confirm Password',
                              style: kTitleTextWhite,
                            ),
                            SizedBox(height: 5.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(7.0),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller: regController.confirmPassController,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Confirm password must be filled";
                                  } else if (value !=
                                      regController.passController.text) {
                                    return "Password did not match";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: kInputDecoration.copyWith(
                                    hintText: 'Re-insert your password',
                                    fillColor: Colors.purpleAccent,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            SizedBox(height: 30.0),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        InkWell(
                          onTap: () {
                            if (regController.globalKey.currentState!
                                .validate()) {
                              regController.saveAccount();
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
                                'Register now',
                                style: kTitleTextWhite.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        MyRichText(
                          describe: 'Already have an account? ',
                          linkText: 'Click here',
                          link: () {
                            Get.lazyPut(() => LoginController());

                            Get.offAllNamed(AppRouter.urlLogin);
                          },
                        ),
                        SizedBox(height: 50.0),
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
