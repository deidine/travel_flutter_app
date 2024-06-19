import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/material.dart' ;

import '../views/onbording_view.dart'; 
class OnboardingController extends GetxController {
  var pageIndex = 0.obs;
  late PageController pageController;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    // startAutoSlide();
  }

  void startAutoSlide() {
      int nextPage = (pageIndex.value + 1) % demoData.length;
      pageController.animateToPage(nextPage, duration: Duration(milliseconds: 300), curve: Curves.easeIn);

    // timer = Timer.periodic(Duration(seconds: 5), (timer) {
    //   int nextPage = (pageIndex.value + 1) % demoData.length;
    //   pageController.animateToPage(nextPage, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    // });
  }

  @override
  void onClose() {
    pageController.dispose();
    timer?.cancel();
    super.onClose();
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }
}
