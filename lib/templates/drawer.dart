import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget implements PreferredSizeWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // --- ÁREA DE SIMULAÇÃO DE DADOS (Substituir pelo Firebase futuramente) ---

    // Mude para 'true' para ver como fica o menu quando o usuário está logado
    bool isLogged = false;

    // Dados do usuário (virão do Firebase Authentication)
    String userName = isLogged ? "Joca da Silva" : "Usuário Anônimo";
    String userEmail = isLogged ? "joca@email.com" : "Clique aqui para entrar";
    String? photoUrl = isLogged
        ? "https://randomuser.me/api/portraits/lego/5.jpg"
        : null;
    // -------------------------------------------------------------------------

    return Drawer(
      child: ListView(
        // Remove o padding padrão para o cabeçalho tocar o topo da tela
        padding: EdgeInsets.zero,
        children: [
          // Cabeçalho do Drawer (Área do Usuário)
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.green[800]),
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: photoUrl != null
                  ? ClipOval(child: Image.network(photoUrl))
                  : const Icon(Icons.person, size: 40, color: Colors.grey),
            ),

            // Ação ao clicar na área do usuário (Login ou Perfil)
            onDetailsPressed: () {
              if (!isLogged) {
                // Futuro: Navigator.pushNamed(context, '/login');
                print("Ir para tela de Login");
              } else {
                // Futuro: Mostrar detalhes da conta ou Logout
                print("Ver perfil do usuário");
              }
            },
          ),

          // --- Itens do Menu ---
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              // Fecha o drawer antes de navegar
              Navigator.pop(context);
              // Navega para a rota home
              Navigator.pushNamed(context, '/');
            },
          ),

          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Contatos'),
            onTap: () {
              Navigator.pop(context);
              // Como a rota '/contacts' ainda não existe no main.dart,
              // isso dará erro se clicar agora.
              // Futuramente: Navigator.pushNamed(context, '/contacts');
              print("Navegar para Contatos");
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pop(context);
              // Futuramente: Navigator.pushNamed(context, '/about');
              print("Navegar para Sobre");
            },
          ),

          // Linha divisória estética
          const Divider(),

          // Exemplo de botão de Sair (só aparece se estiver logado)
          if (isLogged)
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Sair', style: TextStyle(color: Colors.red)),
              onTap: () {
                print("Executar logout do Firebase");
              },
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
