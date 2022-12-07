// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanctionnateur/classes/chorist.dart';
import 'package:sanctionnateur/classes/sanction.dart';
import 'package:sanctionnateur/pages/chor_list.dart';
import 'package:sanctionnateur/pages/home.dart';
import 'package:sanctionnateur/pages/sanc_view.dart';

class ChorViewPage extends StatefulWidget {
  const ChorViewPage({super.key, required this.chor});

  final Chorist chor;

  @override
  State<ChorViewPage> createState() => _ChorViewPageState();
}

class _ChorViewPageState extends State<ChorViewPage> {
  @override
  Widget build(BuildContext context) {
    final Chorist chor = widget.chor;
    return Scaffold(
      appBar: AppBar(
        title: Text("${chor.lastName.toUpperCase()} ${chor.firstName}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "${chor.lastName.toUpperCase()} ${chor.firstName.toUpperCase()}",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  chor.pupitre,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                if (chor.sanctions.isNotEmpty)
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SancViewPage(chorist: chor),
                        ));
                      },
                      child: Text(
                        "${chor.sanctions.length} sanctions en cours",
                        style: TextStyle(color: Colors.red),
                      ))
              ],
            ),
            Column(
              children: [
                HomeBtn(
                    onPress: () {
                      showDialog(
                        context: context,
                        builder: (context) => SanctionDialog(chorist: chor),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    text: "SANCTIONNER",
                    color: Colors.purple),
                HomeBtn(
                    onPress: () async {
                      chorists.delete(chor.key);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChorListPage(),
                          ));
                    },
                    text: "SUPPRIMER LE PROFIL",
                    color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SanctionDialog extends StatefulWidget {
  const SanctionDialog({super.key, required this.chorist});

  final Chorist chorist;

  @override
  State<SanctionDialog> createState() => _SanctionDialogState();
}

class _SanctionDialogState extends State<SanctionDialog> {
  String raison = sanctionsRaisons[0];
  String sType = sanctionTypes[0];

  TextEditingController autreRaison = TextEditingController();
  TextEditingController autreType = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Chorist chor = widget.chorist;
    return SimpleDialog(
      contentPadding: EdgeInsets.all(20),
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text("Pour quelle raison ?"),
        DropdownButton(
          value: raison,
          items: sanctionsRaisons
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (i) {
            setState(() {
              raison = i.toString();
            });
          },
        ),
        if (raison == "Autre")
          CupertinoTextField(
            controller: autreRaison,
          ),
        SizedBox(
          height: 20,
        ),
        Text("Quelle sanction appliquer ?"),
        DropdownButton(
          value: sType,
          items: sanctionTypes
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (i) {
            setState(() {
              sType = i.toString();
            });
          },
        ),
        if (sType == "Autre")
          CupertinoTextField(
            controller: autreType,
          ),
        SizedBox(
          height: 20,
        ),
        DialogBtns(onOk: () {
          Sanction s = Sanction(raison, sType, DateTime.now(), false);
          if (autreRaison.text.isNotEmpty) s.raison = autreRaison.text;
          if (autreType.text.isNotEmpty) s.type = autreType.text;
          chorists.get(chor.key)?.sanctions.add(s);
          chor.save();

          Navigator.pop(context);
        }),
      ],
    );
  }
}
