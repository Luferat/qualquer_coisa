import 'package:flutter/material.dart';

import '../templates/appbar.dart';
import '../templates/drawer.dart';
import '../templates/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'QualquerCoisa'),
      bottomNavigationBar: MyFooter(),
      drawer: MyDrawer(),

      body: const Text('Conteúdo principal'),
    );
  }
}
