
import 'package:flutter/material.dart';
import 'package:opim_flutter/Utils/OpimUtils.dart';
import 'package:opim_flutter/main.dart';

class BottomNavAdapter extends StatefulWidget {
  @override
  _BottomNavAdapterState createState() => _BottomNavAdapterState();
}

class _BottomNavAdapterState extends State<BottomNavAdapter>{
  int _selectedIndex = 0;
  DateTime currentBackPressTime;
  OpimUtils _opimUtils = OpimUtils();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 3)) {
      currentBackPressTime = now;
      _opimUtils.toastMessage("please tap again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
        child: new Scaffold(
          bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 10,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'Riwayat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Akun',
                ),
              ],
              selectedItemColor: Colors.amber[800],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
    );
  }



}
