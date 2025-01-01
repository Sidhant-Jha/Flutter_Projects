import 'package:flutter/material.dart';
import 'package:food_blog/feed.dart';
import 'package:food_blog/main.dart';
import 'package:food_blog/screens/feed_screen.dart';
import 'package:food_blog/screens/food_screen.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget
{
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
       ()=>  BottomNavigationBar(
          // fixedColor: Colors.black,
          showSelectedLabels: true, 
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black, 
          backgroundColor:const Color.fromARGB(255, 237, 222, 95),
          unselectedItemColor: Colors.black,
          elevation: 18,
          onTap: (index) => controller.selectedIndex.value = index,
          currentIndex: controller.selectedIndex.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black), label: 'Home', backgroundColor: const Color.fromARGB(255, 255, 203, 125),),
            BottomNavigationBarItem(icon: Icon(Icons.flatware, color: Colors.black), label: 'Food'/*, backgroundColor: Colors.black*/),
            BottomNavigationBarItem(icon: Icon(Icons.fact_check_outlined, color: Colors.black), label: 'Feed'/*, backgroundColor: Colors.black*/),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined, color: Colors.black), label: 'Profile'/*, backgroundColor: Colors.black*/),
          ]
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value])
    );
  }
  
}

class NavigationController extends GetxController
{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [HomeScreen(), FoodScreen(), FeedScreen(), Container(color: Colors.blue)];
}