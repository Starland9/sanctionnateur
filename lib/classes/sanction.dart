import 'package:hive/hive.dart';

part 'sanction.g.dart';

final List sanctionTypes = [
  "Un Morceau de savon",
  "Un Détergent",
  "Laver les ténues",
  "Essuyer les banc de l'église",
  "Un carton de craie",
  "Autre"
];

final List sanctionsRaisons = [
  "Bavardage",
  "Manque de respect",
  "Pas fait une saction",
  "Refus d'obtempérer",
  "Autre"
];

@HiveType(typeId: 2)
class Sanction {
  @HiveField(1)
  String raison;
  @HiveField(2)
  String type;
  @HiveField(3)
  DateTime date;
  @HiveField(4)
  bool fait;

  Sanction(this.raison, this.type, this.date, this.fait);
}

var sanctions = Hive.box<Sanction>("sanctions");
