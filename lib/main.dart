import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/router/route_name.dart';
import 'package:todo_app/ui/common/app_page.dart';
import 'base_view/app_binding.dart';
import 'cache/cache_size_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set cache app
  initCacheImageNetworkMemory(1024 * 1024 * 500);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("vi");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cash Centre',
      locale: const Locale('vi', 'VI'),
      initialBinding: AppBinding(),
      getPages: AppPage.pages,
      initialRoute: AppRouteName.main,
    );
  }
}