import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeLogar extends StatelessWidget {
  const HomeLogar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 100, 32, 10),
        child: Center(
          child: Column(
            children: [
              AutoSizeText(
                'Notícias\nNa Hora',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                minFontSize: 40,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  height: 220,
                  child: Image.asset('imagens/assets/News-Logo.png')
                ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.fromLTRB(60, 10, 60, 10)),
                  child: const Text(
                    'Logar',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                  child: const Text(
                    'Registrar-se',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}