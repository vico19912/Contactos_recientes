import 'package:contactos_recientes/view/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de contactos recientes',
      home: const MainPage(title: 'Lista de Contactos'),
    );
  }
}


