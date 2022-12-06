// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sanctionnateur/pages/chor_view.dart';

final List columnLabels = ["ID", "Nom", "Prénom", "Pupitre", "Voir"];
final List appelColumnLabels = ["Nom", "Prénom", "Présent"];
final List pupitres = ["Basse", "Alto", "Ténor", "Sopra"];

class Chorist {
  final int id;
  final String firstName;
  final String lastName;
  final String pupitre;
  DateTime lastPresentDate;

  Chorist(this.id, this.firstName, this.lastName, this.pupitre,
      this.lastPresentDate);

  bool get isPresent => DateTime.now().day == lastPresentDate.day;

  List rowLabels(context) => [
        id.toString(),
        lastName,
        firstName,
        pupitre,
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChorViewPage(chor: this),
                ));
          },
          icon: Icon(
            Icons.info,
            color: Colors.green,
          ),
        ),
      ];

  DataRow dataRow(context) => DataRow(
        cells: rowLabels(context)
            .map(
              (e) => DataCell(e is String ? Text(e) : e),
            )
            .toList(),
      );
}

List<Chorist> chorList = [
  Chorist(1, "Landry", "Simo", "Ténor", DateTime.now()),
  Chorist(2, "Brunel", "Talla", "Alto", DateTime(2022, 11, 29)),
  Chorist(3, "Anais", "Ange", "Sopra", DateTime(2022, 11, 15)),
];
