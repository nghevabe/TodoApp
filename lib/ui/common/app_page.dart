import 'package:get/get.dart';
import 'package:todo_app/ui/detail/detail_screen_binding.dart';
import 'package:todo_app/ui/detail/detail_screen_view.dart';
import 'package:todo_app/ui/home/home_binding.dart';
import 'package:todo_app/ui/main/main_view.dart';

import '../../router/route_name.dart';
import '../add/add_task_binding.dart';
import '../add/add_task_view.dart';
import '../home/home_view.dart';
import '../main/main_binding.dart';

class AppPage {

  static final List<GetPage> pages = [

    GetPage(
      name: AppRouteName.main,
      page: () => MainView(),
      binding: MainBinding(),
    ),

    GetPage(
      name: AppRouteName.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRouteName.detail,
      page: () => DetailScreenView(),
      binding: DetailScreenBinding(),
    ),

    GetPage(
      name: AppRouteName.add,
      page: () => AddTaskView(),
      binding: AddTaskBinding(),
    ),

  ];

}
