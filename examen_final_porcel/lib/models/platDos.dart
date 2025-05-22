// To parse this JSON data, do
//
//     final plat = platFromMap(jsonString);

import 'dart:convert';

List<Plat> platFromMap(String str) => List<Plat>.from(json.decode(str).map((x) => Plat.fromMap(x)));

String platToMap(List<Plat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Plat {
    String id;
    String nom;
    String descripcio;
    String foto;
    String alergens;
    String tipus;

    Plat({
        required this.id,
        required this.nom,
        required this.descripcio,
        required this.foto,
        required this.alergens,
        required this.tipus,
    });

    factory Plat.fromMap(Map<String, dynamic> json) => Plat(
        id: json["id"],
        nom: json["nom"],
        descripcio: json["descripcio"],
        foto: json["foto"],
        alergens: json["alergens"],
        tipus: json["tipus"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "descripcio": descripcio,
        "foto": foto,
        "alergens": alergens,
        "tipus": tipus,
    };
}
