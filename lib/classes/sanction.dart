final List sanctionTypes = [
  "Un Morceau de savon",
  "Un Détergent",
  "Laver les ténues",
  "Essuyer les banc de l'église",
  "Autre"
];

final List sanctionsRaisons = [
  "Bavardage",
  "Manque de respect",
  "Pas fait une saction",
  "Refus d'obtempérer",
  "Autre"
];

class Sanction {
  final int id;
  final int choristId;
  final String raison;
  final String type;
  final DateTime date;
  bool fait;

  Sanction(this.id, this.choristId, this.raison, this.type, this.date, this.fait);
}

final List<Sanction> sanctionsList = [
  Sanction(1, 1, sanctionsRaisons[0], sanctionTypes[0], DateTime.now(), false),
  Sanction(2, 1, sanctionsRaisons[2], sanctionTypes[2], DateTime.now(), true),
  Sanction(3, 2, sanctionsRaisons[1], sanctionTypes[3], DateTime.now(), false),
];
