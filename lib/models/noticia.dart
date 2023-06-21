
import 'package:cloud_firestore/cloud_firestore.dart';

class Noticia {
  String titulo;
  DateTime dataCriacao;
  String autor;
  String pais;
  String linguagem;
  String tipo;
  String descricao;
  String urlNoticia;
  String urlImagem;
  String conteudo;

  Noticia({
    required this.titulo,
    required this.dataCriacao,
    required this.autor,
    required this.pais,
    required this.linguagem,
    required this.tipo,
    required this.descricao,
    required this.urlNoticia,
    required this.urlImagem,
    required this.conteudo,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      titulo: json['title'] as String? ?? 'N/A',
      dataCriacao: DateTime.parse(json['publishedAt'] as String? ?? ''),
      autor: json['author'] as String? ?? 'N/A',
      pais: json['country'] as String? ?? 'N/A',
      linguagem: json['language'] as String? ?? 'N/A',
      tipo: json['category'] as String? ?? 'N/A',
      descricao: json['description'] as String? ?? 'N/A',
      urlNoticia: json['url'] as String? ?? '',
      urlImagem: json['urlToImage'] as String? ?? '',
      conteudo: json['content'] as String? ?? '',
    );
  }

}

class Noticias {
  List<Noticia> listaNoticias;

  Noticias({required this.listaNoticias});

  factory Noticias.fromJson(Map<String, dynamic> json) {
    List<dynamic> noticias = json['articles'] as List<dynamic>;
    List<Noticia> listaNoticias = noticias
        .map((noticia) => Noticia.fromJson(noticia as Map<String, dynamic>))
        .toList();

    return Noticias(listaNoticias: listaNoticias);
  }
}

