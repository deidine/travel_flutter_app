import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/app/modules/home/views/SwiperCard.dart';
import 'package:travel/app/modules/home/views/SwiperModel.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    HomePage(),
    const Center(child: Text('Page 2')),
    const Center(child: Text('Page 3')),
    const Center(child: Text('Page 4')),
  ];

  final List<BottomNavigationBarItem> _navItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Saved',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notification',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  final Widget _fab = FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  );

  @override
  Widget build(BuildContext context) {
final SwiperModel swper;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.blueAccent,
             unselectedItemColor: Colors.grey,
            items: _navItems,
            onTap: controller.onNavItemTapped,
          ),
        );
      }),
      body: Obx(() {
        return _pages[controller.selectedIndex.value];
      }),
      floatingActionButton: _fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomePage extends GetView<HomeController> {
  HomePage({
    super.key,
  });

  final AppinioSwiperController controllerSwip = AppinioSwiperController();
   
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.network(
                        "https://avatars.githubusercontent.com/u/92623952?s=96&v=4"),
                  ),
                ),
                Column(
                  children: [
                    Text("Hi Mike"),
                    Text(
                      "Good After Noon",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Icon(Icons.notifications)
              ],
            ),
            SizedBox(
              height: Get.height * 0.25,
              child: AppinioSwiper(
                
                allowUnlimitedUnSwipe: false,
                defaultDirection: AxisDirection.left,
                controller: controllerSwip,
                cardCount: candidates.length,
                
                onEnd: () {
                  print("direction.toString()");
                },
                allowUnSwipe: true,
                cardBuilder: (BuildContext context, int index) {
                  return SwiperCard(swper: candidates[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                swipeLeftButton(controllerSwip),
                const SizedBox(
                  width: 20,
                ),
                swipeRightButton(controllerSwip),
                const SizedBox(
                  width: 20,
                ),
                unswipeButton(controllerSwip),
              ],
            )
          ]),
    );
  }






















  swipeLeftButton(AppinioSwiperController controllerSwip) {
    return GestureDetector(
      onTap: () {
        controllerSwip.swipeLeft();
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: CupertinoColors.activeGreen,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.activeGreen.withOpacity(0.9),
              spreadRadius: -10,
              blurRadius: 20,
              offset: const Offset(0, 20), // changes position of shadow
            ),
          ],
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.check,
          color: CupertinoColors.white,
          size: 40,
        ),
      ),
    );
  }

  unswipeButton(AppinioSwiperController controllerSwip) {
    return GestureDetector(
      onTap: () {
        controllerSwip.unswipe();
      },
      child: Container(
        height: 60,
        width: 60,
        alignment: Alignment.center,
        child: const Icon(
          Icons.rotate_left_rounded,
          color: CupertinoColors.systemGrey2,
          size: 40,
        ),
      ),
    );
  }

  swipeRightButton(AppinioSwiperController controllerSwip) {
    return GestureDetector(
        onTap: () {
          controllerSwip.swipeRight();
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFF3868),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF3868).withOpacity(0.9),
                spreadRadius: -10,
                blurRadius: 20,
                offset: const Offset(0, 20), // changes position of shadow
              ),
            ],
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.close,
            color: CupertinoColors.white,
            size: 40,
          ),
        ));
  }
}
