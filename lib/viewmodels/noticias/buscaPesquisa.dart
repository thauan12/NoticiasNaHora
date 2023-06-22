import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noticiasnahora/models/noticia.dart';

Future<List<Noticia>> buscarNoticiasPorTitulo(String titulo) async {
  List<Noticia> resultados = [];

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('noticias')
        .where('titulo', isEqualTo: titulo)
        .get();

    resultados = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      DateTime? dataCriacao;
      try {
        if (data.containsKey('publishedAt')) {
          final publishedAt = data['publishedAt'] as String?;
          if (publishedAt != null) {
            dataCriacao = DateTime.parse(publishedAt);
          }
        }
      } catch (e) {
        print('Erro ao converter data de notícia: $e');
      }
      return Noticia(
        titulo: data['title'] as String? ?? 'N/A',
        dataCriacao: dataCriacao,
        autor: data['author'] as String? ?? 'N/A',
        pais: data['country'] as String? ?? 'N/A',
        linguagem: data['language'] as String? ?? 'N/A',
        tipo: data['category'] as String? ?? 'N/A',
        descricao: data['description'] as String? ?? 'N/A',
        urlNoticia: data['url'] as String? ?? '',
        urlImagem: data['urlToImage'] as String? ?? '',
        conteudo: data['content'] as String? ?? '',
      );
    }).toList();
  } catch (e) {
    print('Erro ao buscar notícias por título: $e');
    throw Exception('Falha ao buscar notícias por título');
  }

  return resultados;
}