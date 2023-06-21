import 'dart:async';
import 'dart:convert';
import 'package:noticiasnahora/models/noticia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;


class BuscaDeNoticias {
  late List<Noticia> noticias;
  BuscaDeNoticias({required this.noticias});
  late Timer _timer;

Future<void> iniciarBuscaPeriodica() async {
  // Inicia a busca de notícias imediatamente
  await buscarNoticias();

  // Agendar a busca de notícias a cada período de 1 hora
  _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
    buscarNoticias();
  });
}

Future<void> pararBuscaPeriodica() async {
  // Cancelar o timer
  _timer.cancel();
}

  Future<BuscaDeNoticias> buscarNoticias() async {
    final String apiKey = '912fc586c2894ba88b6f99bed17af924';
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=br&apiKey=$apiKey'));

      if (response.statusCode == 200) {
        final Map<String, dynamic>? data = json.decode(response.body);
        if (data != null) {
          final noticias = Noticias.fromJson(data);

          await salvarNoticiasNoFirebase(noticias.listaNoticias);

          return BuscaDeNoticias(noticias: noticias.listaNoticias);
        } else {
          throw Exception('Dados inválidos na resposta da API');
        }
      } else {
        throw Exception('Falha ao carregar as notícias');
      }
    } catch (e) {
      print('Erro ao buscar notícias: $e');
      throw Exception('Falha ao buscar notícias');
    }
  }
}

Future<void> salvarNoticiasNoFirebase(List<Noticia> noticias) async {
  CollectionReference noticiasRef =
  FirebaseFirestore.instance.collection('noticias');

  for (var noticia in noticias) {
    await noticiasRef.add({
      'titulo': noticia.titulo,
      'dataCriacao': noticia.dataCriacao.toString(),
      'autor': noticia.autor,
      'pais': noticia.pais,
      'linguagem': noticia.linguagem,
      'tipo': noticia.tipo,
      'descricao': noticia.descricao,
      'urlNoticia': noticia.urlNoticia,
      'urlImagem': noticia.urlImagem,
      'conteudo': noticia.conteudo,
    });
  }
}

Future<List<Noticia>> buscarDadosNoFirebase() async {
  try {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection('noticias').get();

    final List<Noticia> noticias = [];

    for (final doc in snapshot.docs) {
      final data = doc.data();
      final noticia = Noticia(
        titulo: data['titulo'],
        dataCriacao: DateTime.parse(data['dataCriacao']),
        autor: data['autor'],
        pais: data['pais'],
        linguagem: data['linguagem'],
        tipo: data['tipo'],
        descricao: data['descricao'],
        urlNoticia: data['urlNoticia'],
        urlImagem: data['urlImagem'],
        conteudo: data['conteudo'],
      );
      noticias.add(noticia);
    }

    return noticias;
  } catch (e) {
    throw Exception('Falha ao buscar os dados no Firebase');
  }
}