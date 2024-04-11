import 'package:flutter/material.dart';
import 'package:mentorando/pages/home_page.dart';
import 'package:mentorando/pages/profile_page.dart';
import 'package:mentorando/pages/sprint_page.dart';

class InitialPage extends StatefulWidget {

  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        selectedItemColor: const Color(0xff363B53),
        unselectedItemColor: Colors.grey.withAlpha(200),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.sync), label: "Sprint"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          SprintPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
