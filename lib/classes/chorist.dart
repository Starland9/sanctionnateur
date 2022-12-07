// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sanctionnateur/classes/sanction.dart';
import 'package:sanctionnateur/pages/chor_view.dart';

part "chorist.g.dart";

final List columnLabels = ["Nom", "Prénom", "Pupitre", ];
final List appelColumnLabels = ["Nom", "Prénom", "Présent"];
final List pupitres = ["Basse", "Alto", "Ténor", "Sopra"];

@HiveType(typeId: 1)
class Chorist extends HiveObject {
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String pupitre;
  @HiveField(4)
  DateTime lastPresentDate;
  @HiveField(5, defaultValue: [])
  List<Sanction> sanctions = [];

  Chorist(this.firstName, this.lastName, this.pupitre, this.lastPresentDate);

  bool get isPresent => DateTime.now().day == lastPresentDate.day;

  List rowLabels(context) => [
        key.toString(),
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

var chorists = Hive.box<Chorist>("chorists");