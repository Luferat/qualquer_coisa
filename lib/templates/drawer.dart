// lib/templates/drawer.dart
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Essas variáveis seriam substituídas depois pelo Firebase Auth
    // Por enquanto vamos simular estados possíveis
    const bool isLoggedIn = false; // ← mude para true para testar logado
    const String displayName = "André Oliveira"; // null quando não logado
    const String photoUrl = "https://randomuser.me/api/portraits/men/45.jpg"; // null quando anônimo
    const String email = "exemplo@email.com";

    return Drawer(
      child: Column(
        children: [
          // Cabeçalho do Drawer (UserAccountsDrawerHeader)
          UserAccountsDrawerHeader(
            accountName: Text(
              isLoggedIn ? (displayName ?? "Usuário") : "Visitante",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              isLoggedIn ? email : "Não autenticado",
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(photoUrl),
              child: null,
            ),
            decoration: BoxDecoration(color: Colors.green[800]),
          ),

          // Itens do menu
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              // Já estamos na rota '/' então normalmente só fecha
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Contatos'),
            onTap: () {
              Navigator.pop(context);
              // Futuramente: Navigator.pushNamed(context, '/contacts');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Em desenvolvimento...')),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pop(context);
              // Futuramente: Navigator.pushNamed(context, '/about');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Em desenvolvimento...')),
              );
            },
          ),

          const Spacer(),

          // Área inferior - Login / Logout
          if (!isLoggedIn)
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Fazer Login'),
              tileColor: Colors.grey[100],
              onTap: () {
                Navigator.pop(context);
                // Futuramente: aqui chamaria o login com Google
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login será implementado em breve'),
                  ),
                );
              },
            )
          else
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              tileColor: Colors.red[50],
              textColor: Colors.red[900],
              iconColor: Colors.red[900],
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout simulado')),
                );
              },
            ),
        ],
      ),
    );
  }
}
