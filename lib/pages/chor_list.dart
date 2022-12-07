// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sanctionnateur/classes/chorist.dart';
import 'package:sanctionnateur/pages/chor_view.dart';

class ChorListPage extends StatefulWidget {
  const ChorListPage({super.key});

  @override
  State<ChorListPage> createState() => _ChorListPageState();
}

class _ChorListPageState extends State<ChorListPage> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleNormal(),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Center(child: Text("${chorists.length.toString()} choristes")),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
            showCheckboxColumn: false,
            columns: columnLabels
                .map(
                  (e) => DataColumn(
                    label: Text(
                      e.toString().toUpperCase(),
                    ),
                  ),
                )
                .toList(),
            rows: chorists.values
                .toList()
                .map(
                  (c) => DataRow(
                      color: MaterialStatePropertyAll(
                        c.isPresent
                            ? Colors.green.shade50
                            : Color.fromARGB(255, 208, 75, 75),
                      ),
                      onSelectChanged: (e) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChorViewPage(chor: c),
                          ),
                        );
                      },
                      cells: [
                        DataCell(Text(c.lastName.toUpperCase())),
                        DataCell(Text(c.firstName)),
                        DataCell(Text(c.pupitre)),
                      ]),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return ChorListDialog();
              })).then((value) {
            setState(() {});
          });
        },
        label: Text("Ajouter un nouveau choriste"),
        icon: Icon(Icons.add),
      ),
    );
  }
}

class SearchTitle extends StatelessWidget {
  const SearchTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          focusColor: Colors.white,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(),
          hintText: "Rechercher un choriste",
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )),
    );
  }
}

class TitleNormal extends StatelessWidget {
  const TitleNormal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Liste des Choristes");
  }
}

class ChorListDialog extends StatefulWidget {
  const ChorListDialog({super.key});

  @override
  State<ChorListDialog> createState() => _ChorListDialogState();
}

class _ChorListDialogState extends State<ChorListDialog> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  String pupitre = pupitres[0];

  @override
  Widget build(BuildContext context) {
    var chorists = Hive.box<Chorist>("chorists");

    return SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                leading: Text("Nom: "),
                title: CupertinoTextField(
                  controller: lastName,
                ),
              ),
              ListTile(
                leading: Text("Prénom: "),
                title: CupertinoTextField(
                  controller: firstName,
                ),
              ),
              ListTile(
                leading: Text("Pupitre: "),
                title: DropdownButton(
                    value: pupitre,
                    items: pupitres
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (i) {
                      setState(() {
                        pupitre = i.toString();
                      });
                    }),
              ),
              DialogBtns(
                onOk: () {
                  setState(() {
                    chorists.add(
                      Chorist(firstName.text, lastName.text, pupitre,
                          DateTime.now()),
                    );
                  });
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class DialogBtns extends StatelessWidget {
  DialogBtns({
    Key? key,
    required this.onOk,
  }) : super(key: key);

  void Function()? onOk;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: onOk,
          child: Text("Ok"),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Annuler"),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
          ),
        ),
      ],
    );
  }
}

// 680239486