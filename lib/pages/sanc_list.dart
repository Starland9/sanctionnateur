// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sanctionnateur/classes/chorist.dart';
import 'package:sanctionnateur/pages/sanc_view.dart';

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
          children: chorists.values
              .where((c) => c.sanctions.isNotEmpty)
              .map(
                (c) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.red.shade200,
                    title: Text("${c.lastName.toUpperCase()} ${c.firstName}"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SancViewPage(chorist: c),
                          ));
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
