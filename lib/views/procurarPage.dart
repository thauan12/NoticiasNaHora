import 'package:flutter/material.dart';

class ProcurarPage extends StatefulWidget {
  const ProcurarPage({Key? key}) : super(key: key);

  @override
  State<ProcurarPage> createState() => _ProcurarPageState();
}

class _ProcurarPageState extends State<ProcurarPage> {
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
