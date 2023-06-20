import 'package:flutter/material.dart';

import '../viewmodels/firebase/autenticação.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterEmaileSenha registerEmaileSenha = RegisterEmaileSenha();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 50, 32, 10),
        child: Column(
          children: [
            SizedBox(
                height: 180,
                child: Image.asset('imagens/assets/News-Logo.png')
            ),
            SizedBox(height: 50,),
            TextField(
              controller: registerEmaileSenha.controladorEmail,
              decoration: const InputDecoration(
                label: Text('E-mail'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15,),
            TextField(
              controller: registerEmaileSenha.controladorSenha,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() async {
                  await registerEmaileSenha.register(context);
                });
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}