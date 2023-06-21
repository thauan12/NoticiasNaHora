import 'package:flutter/material.dart';
import '../models/noticia.dart';


class NoticiaDetalhadaScreen extends StatelessWidget {
  final Noticia? noticia;

  const NoticiaDetalhadaScreen({this.noticia, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notícia Detalhada'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (noticia!.urlImagem.isNotEmpty)
              Image.network(noticia!.urlImagem),
            if (noticia!.urlImagem.isEmpty)
              Image.asset('imagens/assets/News-Logo.png'),
            SizedBox(height: 16),
            Text(noticia!.titulo, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(noticia!.dataCriacao.toString(), style: TextStyle(fontSize: 16)),
            Text(noticia!.autor, style: TextStyle(fontSize: 16)),
            Text(noticia!.descricao, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(noticia!.conteudo, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}