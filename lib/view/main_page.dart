import 'package:contactos_recientes/view/contactos_recientes.dart';
import 'package:contactos_recientes/view/mi_contacto.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final dynamic title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2, 
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.contacts), text: 'Contactos'),
                Tab(icon: Icon(Icons.history), text: 'Recientes'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MiContacto(),
              ContactosRecientes(),
            ],
        ))
        ),
    );
  }
}