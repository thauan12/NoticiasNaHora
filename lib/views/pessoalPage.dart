import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noticiasnahora/viewmodels/firebase/autentica%C3%A7%C3%A3o.dart';

class PessoalPage extends StatefulWidget {
  const PessoalPage({Key? key}) : super(key: key);

  @override
  State<PessoalPage> createState() => _PessoalPageState();
}

class _PessoalPageState extends State<PessoalPage> {
  String _nome = 'Seu Nome';
  bool _isEditingNome = false;
  TextEditingController _nomeController = TextEditingController();

  @override
  void initState() {
    _nomeController.text = _nome;
    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  void _toggleEditingNome() {
    setState(() {
      _isEditingNome = !_isEditingNome;
    });
  }

  void _saveNome() {
    setState(() {
      _nome = _nomeController.text;
      _toggleEditingNome();
    });
  }

  Widget _buildNomeSection() {
    if (_isEditingNome) {
      return Row(
        children: [
          Expanded(
            child: TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
          ),
          IconButton(
            onPressed: _saveNome,
            icon: Icon(Icons.check),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: Text(
              _nome,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: _toggleEditingNome,
            icon: Icon(Icons.edit),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pessoal'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('imagens/assets/user.jpg'), // Substitua pelo caminho da imagem do perfil
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      // Implemente a lógica para trocar a foto de perfil com base no Firebase
                    },
                    icon: Icon(Icons.edit),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildNomeSection(),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Saiba mais'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Informações'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Olá, somos o Noticias Na Hora, um aplicativo desenvolvido para deixar nossos leitores por dentro de tudo que está acontecendo no mundo, desde política a criptomoeda.'),
                        SizedBox(height: 10),
                        Text('Agradecemos por usar nossa página.'),
                        SizedBox(height: 10),
                        Text('Para suporte, entre em contato pelo e-mail: thauan@noticiasnahora.com'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Fechar'),
                      ),
                    ],
                  );
                },
              );
            },

          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Avalie-nos'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Avalie-nos'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Por favor, avalie nosso aplicativo.'),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Fluttertoast.showToast(msg: 'Você deu 1 estrela');
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.star_border),
                              color: Colors.grey,
                            ),
                            IconButton(
                              onPressed: () {
                                Fluttertoast.showToast(msg: 'Você deu 2 estrelas');
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.star_border),
                              color: Colors.grey,
                            ),
                            IconButton(
                              onPressed: () {
                                Fluttertoast.showToast(msg: 'Você deu 3 estrelas');
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.star_border),
                              color: Colors.grey,
                            ),
                            IconButton(
                              onPressed: () {
                                Fluttertoast.showToast(msg: 'Você deu 4 estrelas');
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.star_border),
                              color: Colors.grey,
                            ),
                            IconButton(
                              onPressed: () {
                                Fluttertoast.showToast(msg: 'Você deu 5 estrelas');
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.star_border),
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {Logout().logout(context);
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Noticias No Dia',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '19/06/2023',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
