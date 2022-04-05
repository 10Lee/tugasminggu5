import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'routes/app_router.dart';
import 'controllers/injector.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
      ),
      initialBinding: Injector(),
      initialRoute: AppRouter.urlLogin,
      getPages: AppRouter().routes,
    );
  }
}
