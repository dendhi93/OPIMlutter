import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavAdapter extends StatefulWidget {
  @override
  _BottomNavAdapterState createState() => _BottomNavAdapterState();
}

class _BottomNavAdapterState extends State<BottomNavAdapter>{
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
                backgroundColor: Colors.tealAccent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Riwayat',
                backgroundColor: Colors.tealAccent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Akun',
                backgroundColor: Colors.tealAccent,
              ),
            ],
          selectedItemColor: Colors.amber[800],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      body: Container(color: Colors.white),
    );
  }

}
