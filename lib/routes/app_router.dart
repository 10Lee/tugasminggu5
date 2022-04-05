import 'package:get/get.dart';
import 'package:tugas_minggu_5/views/add_article.dart';
import 'package:tugas_minggu_5/views/forms/login.dart';
import 'package:tugas_minggu_5/views/forms/registration.dart';
import 'package:tugas_minggu_5/views/homepage.dart';
import 'package:tugas_minggu_5/views/profile.dart';

class AppRouter {
  static String urlHome = '/';
  static String urlProfile = '/profile';
  static String urlRegister = '/register';
  static String urlLogin = '/login';
  static String urlAddArticle = '/add_article';

  List<GetPage> routes = [
    GetPage(name: urlHome, page: () => Home()),
    GetPage(name: urlProfile, page: () => Profile()),
    GetPage(name: urlRegister, page: () => RegisterView()),
    GetPage(name: urlLogin, page: () => LoginView()),
    GetPage(name: urlAddArticle, page: () => AddArticle()),
  ];
}
