// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sanctionnateur/classes/chorist.dart';

class AppelPage extends StatefulWidget {
  const AppelPage({super.key});

  @override
  State<AppelPage> createState() => _AppelPageState();
}

class _AppelPageState extends State<AppelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Faire l'appel"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
            columns: appelColumnLabels
                .map((e) => DataColumn(label: Text(e.toString().toUpperCase())))
                .toList(),
            rows: chorists.values
                .map((c) => DataRow(cells: [
                      DataCell(Text(c.lastName.toUpperCase())),
                      DataCell(Text(c.firstName)),
                      DataCell(Switch(
                          value: c.isPresent,
                          onChanged: (v) async {
                            c.lastPresentDate = DateTime.now();
                            await c.save();
                            setState(() {});
                          })),
                    ]))
                .toList(),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Colors.purple,
      //   onPressed: () {},
      //   label: Text("J'ai terminé l'appel"),
      // ),
    );
  }
}
