import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    Container(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Safeguard Mobile",
        ),
      centerTitle: true,
      leading: BackButton(),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(CupertinoIcons.home, 'Home', 0),
            buildNavBarItem(CupertinoIcons.calendar, 'Schedule', 1),
            const SizedBox(width: 20,),
            buildNavBarItem(CupertinoIcons.doc_checkmark_fill, 'Report', 3),
            buildNavBarItem(CupertinoIcons.profile_circled, 'Profile', 4),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: Colors.blue,
          elevation: 10,
          child: InkWell(
            child: SizedBox(
              width: 80,
              height: 80,
              child: Icon(
                  CupertinoIcons.qrcode,
                  color: Colors.white,
                  size: 50,),

            ),
        ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index){
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
          color: _selectedIndex == index ? Colors.blue : Colors.grey,
          ),
          Text(label,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.blue : Colors.grey,),
          ),
        ],
      ),
    );
  }
}