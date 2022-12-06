// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanctionnateur/classes/chorist.dart';

class ChorListPage extends StatefulWidget {
  const ChorListPage({super.key});

  @override
  State<ChorListPage> createState() => _ChorListPageState();
}

class _ChorListPageState extends State<ChorListPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Choristes"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          // ignore: prefer_const_literals_to_create_immutables
          child: DataTable(
            columnSpacing: 30,
            columns: columnLabels
                .map(
                  (e) => DataColumn(
                    label: Text(
                      e.toString().toUpperCase(),
                    ),
                  ),
                )
                .toList(),
            rows: chorList.map((e) => e.dataRow(context)).toList(),
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
              }));
        },
        label: Text("Ajouter un nouveau choriste"),
        icon: Icon(Icons.add),
      ),
    );
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
    return SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ListTile(
                leading: Text("Nom: "),
                title: CupertinoTextField(),
              ),
              ListTile(
                leading: Text("Prénom: "),
                title: CupertinoTextField(),
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
              DialogBtns(onOk: (){},)
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