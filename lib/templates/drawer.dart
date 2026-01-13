import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget implements PreferredSizeWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Text('Menu principal'));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
