// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sanctionnateur/classes/chorist.dart';

class AppelPage extends StatefulWidget {
  const AppelPage({super.key});

  @override
  State<AppelPage> createState() => _AppelPageState();
}

class _AppelPageState extends State<AppelPage> {
  List<Chorist> localChorList = chorList;
  @override
  Widget build(BuildContext context) {
    localChorList.sort(((a, b) => a.lastName.compareTo(b.lastName)));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Faire l'appel"),
        actions: [
          IconButton(
              onPressed: () => setState(() {
                    localChorList = chorList;
                  }),
              icon: Icon(Icons.restore)),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
            columns: appelColumnLabels
                .map((e) => DataColumn(label: Text(e.toString().toUpperCase())))
                .toList(),
            rows: localChorList
                .map((e) => DataRow(cells: [
                      DataCell(Text(e.lastName)),
                      DataCell(Text(e.firstName)),
                      DataCell(Checkbox(
                          fillColor: MaterialStatePropertyAll(Colors.purple),
                          value: e.isPresent,
                          onChanged: (value) => setState(() {
                                e.lastPresentDate = DateTime.now();
                              })))
                    ]))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        onPressed: () {},
        label: Text("J'ai terminé l'appel"),
      ),
    );
  }
}
