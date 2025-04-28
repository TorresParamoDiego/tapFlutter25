
import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:tap2025/utils/global_values.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      drawer: SidebarX(
        headerBuilder: (context, extended) {
          return UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
            accountName: Text('Diego Torres'), 
            accountEmail: Text('23030943@itcelaya.edu.mx')
          );
        },
        extendedTheme: SidebarXTheme(
          width: 200
        ),
        controller: SidebarXController(selectedIndex: 0,extended: true),
        items: [
          SidebarXItem(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context,'/reto');
            },
            icon: Icons.home, label: "Challenge App"
          )
        ],
      ),
      //endDrawer para derecho
      appBar: AppBar(
        title: Text('Panel de control °-°'),
      ),
      body: HawkFabMenu(
        icon: AnimatedIcons.menu_arrow,
        body: Center(
          child: Text('Your content :3'),
        ), 
        items: [
          HawkFabMenuItem(
            label: 'Theme Dark', 
            ontap: (){
              GlobalValues.themeMode.value=0;
            }, 
            icon: Icon(Icons.dark_mode)
          ),
          HawkFabMenuItem(
            label: 'Theme Light', 
            ontap: (){
              GlobalValues.themeMode.value=1;
            }, 
            icon: Icon(Icons.light_mode)
          ),
          HawkFabMenuItem(
            label: 'Theme Warm', 
            ontap: (){
              GlobalValues.themeMode.value=2;
            }, 
            icon: Icon(Icons.fireplace)
          ),
        ],
      )
    );
  }
}
/* para un telefono entrar a una base de datos API
*/