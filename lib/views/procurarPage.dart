import 'package:flutter/material.dart';
import 'package:noticiasnahora/models/noticia.dart';
import 'package:noticiasnahora/viewmodels/noticias/buscaPesquisa.dart';

class ProcurarPage extends StatefulWidget {
  @override
  _ProcurarPageState createState() => _ProcurarPageState();
}

class _ProcurarPageState extends State<ProcurarPage> {
  String _titulo = '';
  List<Noticia> _resultados = [];

  void _realizarProcura(String titulo) async {
    List<Noticia> resultados = await buscarNoticiasPorTitulo(titulo);
    setState(() {
      _resultados = resultados;
    });
  }

  Widget _buildResultadoCard(Noticia noticia) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Image.network(noticia.urlImagem),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noticia.titulo,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    noticia.dataCriacao.toString(), // Ajuste conforme a formatação desejada
                  ),
                  SizedBox(height: 4),
                  Text(
                    noticia.autor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _titulo = value;
              });
              _realizarProcura(_titulo);
            },
            decoration: InputDecoration(
              labelText: 'Digite o título',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _resultados.length,
              itemBuilder: (context, index) {
                return _buildResultadoCard(_resultados[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
