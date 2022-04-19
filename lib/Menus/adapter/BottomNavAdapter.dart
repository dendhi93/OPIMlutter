
import 'package:flutter/material.dart';
import 'package:opim_flutter/Menus/Account/view/Account.dart';
import 'package:opim_flutter/Menus/History/History.dart';
import 'package:opim_flutter/Menus/Home/view/Home.dart';
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
  final Home _home = Home();
  final History _history = History();
  final Account _account = Account();


  Widget _selectedMenu = Home();
  Widget _selectedScreen(int intSreen){
    switch(intSreen){
      case 0 :
        return _home;
        break;
      case 1 :
        return _history;
        break;
      case 2:
        return _account;
        break;
    }
    return null;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedMenu = _selectedScreen(index);
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
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Account',
                ),
              ],
              selectedItemColor: Colors.amber[800],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
          body: Container(color: Colors.white,
              child : Center(child: _selectedMenu)),
        ),
    );
  }



}
