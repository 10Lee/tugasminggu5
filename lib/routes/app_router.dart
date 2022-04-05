import 'package:get/get.dart';
import 'package:tugas_minggu_5/controllers/bindings/home_binding.dart';
import 'package:tugas_minggu_5/controllers/bindings/login_binding.dart';
import 'package:tugas_minggu_5/controllers/bindings/new_article_binding.dart';
import 'package:tugas_minggu_5/controllers/bindings/profile_binding.dart';
import 'package:tugas_minggu_5/controllers/bindings/register_binding.dart';
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
    GetPage(
      name: urlHome,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: urlProfile,
      page: () => Profile(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: urlRegister,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: urlLogin,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: urlAddArticle,
      page: () => AddArticle(),
      binding: NewArticleBinding(),
    ),
  ];
}
