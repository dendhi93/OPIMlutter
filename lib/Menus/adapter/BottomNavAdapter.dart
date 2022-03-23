import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavAdapter extends StatefulWidget {
  @override
  _BottomNavAdapterState createState() => _BottomNavAdapterState();
}

class _BottomNavAdapterState extends State<BottomNavAdapter>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
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
        ),
    );
  }

}
