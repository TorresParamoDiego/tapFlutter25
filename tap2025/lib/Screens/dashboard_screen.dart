import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      drawer: SidebarX(
        extendedTheme: SidebarXTheme(
          width: 200
        ),
        controller: SidebarXController(selectedIndex: 0,extended: true),
        items: [
          SidebarXItem(icon: Icons.home, label: "Practica 1")
        ],
      ),
      //endDrawer para derecho
      appBar: AppBar(
        title: Text('Panel de control °-°'),
      ),
      body: Center(child: Text('Your content')),
    );
  }
}