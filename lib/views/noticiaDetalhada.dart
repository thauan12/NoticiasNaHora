import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/noticia.dart';



class NoticiaDetalhadaScreen extends StatelessWidget {
  final Noticia? noticia;

  const NoticiaDetalhadaScreen({this.noticia, Key? key}) : super(key: key);

  void _abrirUrlNoticia(String urlNoticia) async {
    Uri url = Uri.parse(urlNoticia);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Não foi possível abrir a URL: $urlNoticia';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notícia Detalhada'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                noticia!.titulo,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              if (noticia!.urlImagem.isNotEmpty)
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(noticia!.urlImagem, fit: BoxFit.cover),
                ),
              if (noticia!.urlImagem.isEmpty)
                Image.asset('imagens/assets/News-Logo.png'),
              SizedBox(height: 16),
              Text(
                noticia!.conteudo.isNotEmpty
                    ? noticia!.conteudo
                    : 'Não há informações disponíveis no aplicativo. Clique no link abaixo para obter mais detalhes.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(noticia!.autor, style: TextStyle(fontSize: 16)),
                  Text(noticia!.dataCriacao.toString(), style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () => _abrirUrlNoticia(noticia!.urlNoticia),
                child: Text(
                  noticia!.urlNoticia,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}