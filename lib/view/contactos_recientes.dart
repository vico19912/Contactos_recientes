import 'package:contactos_recientes/helpers/helpers.dart';
import 'package:contactos_recientes/model/contacto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactosRecientes extends StatefulWidget {
  const ContactosRecientes({super.key});

  @override
  State<ContactosRecientes> createState() => _ContactosRecientesState();
}

class _ContactosRecientesState extends State<ContactosRecientes> {
  List<Contacto> lstContactosRecientes = [];
  List<Contacto> lstContactos = [];
  List<String> lstNames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: lstContactosRecientes.length,
        itemBuilder: (BuildContext context, int index) {
          Contacto temp = lstContactosRecientes[index];
          return getContacto(temp);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _insertarContactosLista();
  }

  Future<void> _insertarContactosLista() async {
    _insertarContacto();
    await _obtenerContactosRecientes();

    if (lstNames.isNotEmpty) {
      for (var contacto in lstContactos) {
        if (lstNames.contains(contacto.name)) {
          lstContactosRecientes.add(contacto);
        }
      }
    }

    setState(() {});
  }

  Future<void> _obtenerContactosRecientes() async {
    final pref = await SharedPreferences.getInstance();
    List<String>? names = [];

    if (pref.getStringList('recents') != null) {
      names = pref.getStringList('recents');
      lstNames.addAll(names as Iterable<String>);
    }
  }

  void _insertarContacto() {
    lstContactos.add(Contacto(name: "Juan", phoneNumber: "1234567890"));
    lstContactos.add(Contacto(name: "Maria", phoneNumber: "0987654321"));
    lstContactos.add(Contacto(name: "Pedro", phoneNumber: "1122334455"));
    lstContactos.add(Contacto(name: "Ana", phoneNumber: "5566778899"));
    lstContactos.add(Contacto(name: "Luis", phoneNumber: "6677889900"));
    lstContactos.add(Contacto(name: "Sofia", phoneNumber: "2233445566"));
    lstContactos.add(Contacto(name: "Carlos", phoneNumber: "7788990011"));
    lstContactos.add(Contacto(name: "Elena", phoneNumber: "3344556677"));
    lstContactos.add(Contacto(name: "Miguel", phoneNumber: "8899001122"));
    lstContactos.add(Contacto(name: "Laura", phoneNumber: "4455667788"));
    lstContactos.add(Contacto(name: "Diego", phoneNumber: "9900112233"));
    lstContactos.add(Contacto(name: "Paula", phoneNumber: "5566778899"));
    lstContactos.add(Contacto(name: "Ricardo", phoneNumber: "6677889901"));
    lstContactos.add(Contacto(name: "Fernanda", phoneNumber: "7788990022"));
    lstContactos.add(Contacto(name: "Andrés", phoneNumber: "1122334466"));
    lstContactos.add(Contacto(name: "Isabel", phoneNumber: "2233445577"));
    lstContactos.add(Contacto(name: "Javier", phoneNumber: "3344556688"));
    lstContactos.add(Contacto(name: "Natalia", phoneNumber: "4455667799"));
    lstContactos.add(Contacto(name: "Roberto", phoneNumber: "5566778811"));
    lstContactos.add(Contacto(name: "Carmen", phoneNumber: "6677889922"));
    lstContactos.add(Contacto(name: "Hugo", phoneNumber: "7788990033"));
    lstContactos.add(Contacto(name: "Patricia", phoneNumber: "1122334477"));
    lstContactos.add(Contacto(name: "Manuel", phoneNumber: "2233445588"));
    lstContactos.add(Contacto(name: "Verónica", phoneNumber: "3344556699"));
    lstContactos.add(Contacto(name: "Gustavo", phoneNumber: "4455667700"));
    lstContactos.add(Contacto(name: "Andrea", phoneNumber: "5566778822"));
    lstContactos.add(Contacto(name: "Ernesto", phoneNumber: "6677889933"));
    lstContactos.add(Contacto(name: "Rosa", phoneNumber: "7788990044"));
    lstContactos.add(Contacto(name: "Emilio", phoneNumber: "1122334488"));
    lstContactos.add(Contacto(name: "Luisa", phoneNumber: "2233445599"));
  }
}
