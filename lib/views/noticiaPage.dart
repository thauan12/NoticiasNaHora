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
      final buscaDeNoticias = BuscaDeNoticias(noticias: []);
      await buscaDeNoticias.buscarNoticias();

      final noticiasApi = buscaDeNoticias.noticias;
      final noticiasFirebase = await buscarDadosNoFirebase();

      setState(() {
        _noticias = [...noticiasApi, ...noticiasFirebase];
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3, // 30% da largura disponível
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: noticia.urlImagem.isNotEmpty
                              ? Image.network(
                            noticia.urlImagem,
                            fit: BoxFit.cover,
                          )
                              : Image.asset(
                            'imagens/assets/News-Logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              noticia.titulo,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(noticia.dataCriacao.toString()),
                            Text(noticia.autor),
                          ],
                        ),
                      ),
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