import 'package:flutter/material.dart';

class MyFooter extends StatelessWidget implements PreferredSizeWidget {

  const MyFooter({super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: () {  },),
            Text('© 2026 Joca da Silva'),
            IconButton(icon: Icon(Icons.arrow_circle_up), onPressed: () {  },)
          ]
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
