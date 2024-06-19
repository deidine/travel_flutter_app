import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel/app/modules/home/views/home_view.dart';
import 'package:travel/app/routes/app_pages.dart';
import '../controllers/onbording_controller.dart'; 
// OnBoarding content Model
class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

// OnBoarding content list
final List<OnBoard> demoData = [
  OnBoard(
    image: "images/onboarding1.png",
    title: "Title 01",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image: "images/onboarding2.png",
    title: "Title 02",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image: "images/onboarding2.png",
    title: "Title 03",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  )
];

// OnBoardingScreen
class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(255, 244, 244, 245),
              Color.fromARGB(255, 238, 236, 238),
              Color.fromARGB(255, 245, 229, 240),
              Color(0xffffb56b),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: controller.onPageChanged,
                itemCount: demoData.length,
                controller: controller.pageController,
                itemBuilder: (context, index) => OnBoardContent(
                  title: demoData[index].title,
                  description: demoData[index].description,
                  image: demoData[index].image,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == controller.pageIndex.value,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const Text("By proceeding you agree to our Privacy Policy"),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                print("Button clicked!");
                if(controller.pageIndex.value == demoData.length - 1) {
                  Get.toNamed(Routes.HOME);
                  // Get.to(() => const HomeView());
                }else{

                controller.startAutoSlide();
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 48),
                height: Get.height.h * 0.075,
                width: Get.width.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                 child: Center(
                  child: Obx(
                    () {
                      return Text(
                        controller.pageIndex.value == demoData.length - 1 ? "Get Started" : "Next",
                        style: const TextStyle(
                          fontFamily: "HappyMonkey",
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                ),
            ),
        )],
        ),
      ),
    );
  }
}

// OnBoarding area widget
class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Expanded(
         child:    Image.asset(image)),
        const Spacer(),

        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
               const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 8,
      height:isActive ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        border: isActive ? null : Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
