import 'package:flutter/material.dart';
import 'package:noticiasnahora/models/noticia.dart';
import 'package:noticiasnahora/viewmodels/noticias/buscarNoticias.dart';
import 'package:noticiasnahora/views/noticiaDetalhada.dart';

class NoticiaScreen extends StatefulWidget {
  const NoticiaScreen({Key? key}) : super(key: key);

  @override
  State<NoticiaScreen> createState() => _NoticiaScreenState();
}

class _NoticiaScreenState extends State<NoticiaScreen> {
  List<Noticia> _noticias = [];

  @override
  void initState() {
    super.initState();
    _buscarNoticias();
  }

  Future<void> _buscarNoticias() async {
    try {
      final noticias = await buscarDadosNoFirebase();
      setState(() {
        _noticias = noticias;
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Erro'),
          content: Text('Falha ao carregar as notícias'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logado'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _buscarNoticias,
        child: ListView.builder(
          itemCount: _noticias.length,
          itemBuilder: (context, index) {
            Noticia noticia = _noticias[index];
            return InkWell(
              onTap: () {
                // Redirecionar para a página de notícia detalhada
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoticiaDetalhadaScreen(noticia: noticia),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (noticia.urlImagem.isNotEmpty)
                        Image.network(noticia.urlImagem),
                      if (noticia.urlImagem.isEmpty)
                        Image.asset('imagens/assets/News-Logo.png'),
                      const SizedBox(height: 8),
                      Text(noticia.titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(noticia.dataCriacao.toString()),
                      Text(noticia.autor),
                      Text(noticia.descricao),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}