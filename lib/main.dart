import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticiasnahora/models/noticia.dart';
import 'package:noticiasnahora/views/homeLogar.dart';
import 'package:noticiasnahora/views/loginScreen.dart';
import 'package:noticiasnahora/views/noticiaDetalhada.dart';
import 'viewmodels/firebase/utils/firebase_options.dart';
import 'views/homeScreen.dart';
import 'views/registerLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
      GetPage(name: '/', page: () => const HomeLogar()),
      GetPage(name: '/login', page: () => const LoginPage()),
      GetPage(name: '/register', page: () => const RegisterPage()),
      GetPage(name: '/home', page: () => const HomeScreen()),
      GetPage(name: '/noticia', page: () => NoticiaDetalhadaScreen()),
],
    theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.limeAccent,
        ),
        primaryColor:  Colors.limeAccent,
        primarySwatch: Colors.lime,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)))),
    home: HomeLogar(),
  ));
}