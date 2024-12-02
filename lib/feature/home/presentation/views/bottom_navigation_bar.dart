import 'package:flutter/material.dart';
import 'package:new_bright_minds/feature/home/presentation/views/widget/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text("Bookmarks Screen")),
    const Center(child: Text("Notifications Screen")),
    const Center(child: Text("Profile Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6390cf),
                  Color(0xFF2c2c68),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color: _currentIndex == 0 ? Colors.white : Colors.grey,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: _currentIndex == 1 ? Colors.white : Colors.grey,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: _currentIndex == 2 ? Colors.white : Colors.grey,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    color: _currentIndex == 3 ? Colors.white : Colors.grey,
                  ),
                  label: '',
                ),
              ],
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.transparent, // اجعلها شفافة لتظهر الخلفية
              elevation: 0, // أزل الظل لتبدو متناسقة
            ),
          ),
        ),
      ),
    );
  }
}
