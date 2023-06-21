import 'package:flutter/material.dart';
import 'package:noticiasnahora/views/noticiaPage.dart';
import 'package:noticiasnahora/views/pessoalPage.dart';
import 'package:noticiasnahora/views/procurarPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _paginaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _paginaSelecionada,
        children: const [
          ProcurarPage(),
          NoticiaScreen(),
          PessoalPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaSelecionada,
        onTap: (index) {
          setState(() {
            _paginaSelecionada = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Procurar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Notícias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pessoal',
          ),
        ],
      ),
    );
  }
}

