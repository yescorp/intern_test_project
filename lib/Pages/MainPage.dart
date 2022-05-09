import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_test_project/Pages/Basket/Basket.dart';
import 'package:intern_test_project/Pages/Catalog/Catalog.dart';
import 'package:intern_test_project/Pages/Profile/Profile.dart';

class MainPage extends StatefulWidget {
  final int startIndex;

  const MainPage({required this.startIndex, Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  void initState(){
    super.initState();

    _selectedIndex = widget.startIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
            index: _selectedIndex,
            children: const [

              Catalog(),
              Basket(),
              Profile()
            ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "lib/assets/home_icon.svg",
                color: _selectedIndex == 0
                    ? const Color.fromARGB(255, 12, 64, 166)
                    : const Color.fromARGB(255, 117, 117, 117),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("lib/assets/basket_icon.svg",
                  color: _selectedIndex == 1
                      ? const Color.fromARGB(255, 12, 64, 166)
                      : const Color.fromARGB(255, 117, 117, 117)),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("lib/assets/profile_icon.svg",
                  color: _selectedIndex == 2
                      ? const Color.fromARGB(255, 12, 64, 166)
                      : const Color.fromARGB(255, 117, 117, 117)),
              label: ""),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
