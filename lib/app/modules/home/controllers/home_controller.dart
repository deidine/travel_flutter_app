import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
    var selectedIndex = 0.obs;
 
   onNavItemTapped(int index) {
   
      selectedIndex.value = index;
    
  }
 
 
}
