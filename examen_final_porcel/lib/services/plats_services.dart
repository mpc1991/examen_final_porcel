import 'dart:convert';

import 'package:examen_final_porcel/models/plat.dart';
import 'package:examen_final_porcel/models/platDos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlatsServices extends ChangeNotifier{
  final String _baseUrl = 'caddd9db2a0281c8c0ae.free.beeceptor.com';
  final List<Plat> plats = []; 
  bool isLoading = true;

  // Constructor
  PlatsServices(){
    this.loadPlats();
  }

  Future loadPlats() async {
    isLoading = true; // Indicamos que estamos cargando datos
    notifyListeners(); // Notificamos a los widgets que dependen de este provider

    // Construimos la URL para hacer la petición GET a Firebase
    final url = Uri.https(_baseUrl, 'api/plats/');
    final respuesta = await http.get(url);
    print(respuesta);

     // Convertimos la respuesta JSON en un mapa de platos
    final List<dynamic> platMaps = json.decode(respuesta.body);

    // Recorremos cada producto recibido y lo agregamos a la lista
    plats.clear();
    platMaps.forEach((key, value) {
      final tempProduct = Plat_old.fromMap(value); // Convertimos el JSON a un objeto Product
      tempProduct.id = key; // Asignamos el ID del producto desde la base de datos
      plats.add(tempProduct); // Lo añadimos a la lista de productos
    });

    isLoading = false;
    notifyListeners(); // Notificamos a los widgets para actualizar la UI
  }

}