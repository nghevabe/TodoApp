import 'package:get/get.dart';
import 'package:todo_app/ui/main/main_view.dart';

import '../../router/route_name.dart';
import '../main/main_binding.dart';

class AppPage {

  static final List<GetPage> pages = [

    GetPage(
      name: AppRouteName.main,
      page: () => MainView(),
      binding: MainBinding(),
    ),

  ];

}
