import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BaseView<C extends BaseController> extends GetView<C> {
  const BaseView({super.key});

  Widget body({required Widget child}) {
    return GestureDetector(
      onTap: () => hideKeyBoard(),
      child: Stack(children: [
        child,
        controller.obx(
              (_) => const SizedBox(),
          onLoading: loadingView(),
          onEmpty: emptyView(),
          onError: errorView,
        )
      ]),
    );
  }

  Widget emptyView() {
    return const SizedBox();
  }

  Widget loadingView() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget errorView(String? error) {
    return const SizedBox();
  }

  hideKeyBoard() => FocusManager.instance.primaryFocus?.unfocus();
}
