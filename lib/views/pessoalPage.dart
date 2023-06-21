import 'package:flutter/material.dart';

class PessoalPage extends StatefulWidget {
  const PessoalPage({Key? key}) : super(key: key);

  @override
  State<PessoalPage> createState() => _PessoalPageState();
}

class _PessoalPageState extends State<PessoalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pessoal'),
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
