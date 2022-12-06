// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sanctionnateur/classes/chorist.dart';
import 'package:sanctionnateur/classes/sanction.dart';

class SnactionsListPage extends StatefulWidget {
  const SnactionsListPage({super.key});

  @override
  State<SnactionsListPage> createState() => _SnactionsListPageState();
}

class _SnactionsListPageState extends State<SnactionsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Liste des sanctions"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: sanctionsList.where((element) => !element.fait).map((s) {
            Chorist chor =
                chorList.where((element) => element.id == s.choristId).first;
            return ListTile(
              isThreeLine: true,
              title: Text("${chor.lastName} ${chor.firstName}"),
              subtitle: Text("${s.type} \nCause: ${s.raison}"),
              trailing: IconButton(
                onPressed: () => setState(() {
                  s.fait = true;
                }),
                icon: Icon(Icons.check_circle),
                color: Colors.green,
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("APPLIQUER LES CHANGEMENTS"),
        backgroundColor: Colors.red,
      ),
    );
  }
}
