import 'package:contactos_recientes/model/contacto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget getContacto(Contacto contacto) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            contacto.name,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            contacto.phoneNumber,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Icon(
              Icons.quick_contacts_dialer,
              size: 30,
            ),
            onTap: () {
              _crearContactoReciente(contacto.name);
            },
          )
        ],
      ),
    ),
  );
}

Future<void> _crearContactoReciente(String contactoName) async {
  final pref = await SharedPreferences.getInstance();
  List<String> lstNames = [];
  List<String>? lstRecents = await _obtenerContactosRecientes();

  lstNames.addAll(lstRecents as Iterable<String>);
  lstNames.add(contactoName);

  await pref.setStringList('recents', lstNames);
}

Future<List<String>?> _obtenerContactosRecientes() async {
  final pref = await SharedPreferences.getInstance();
  List<String>? names = [];

  if (pref.getStringList('recents') != null) {
    names = pref.getStringList('recents');
  }
  return names;
}
