// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sanctionnateur/classes/chorist.dart';

class SancViewPage extends StatefulWidget {
  const SancViewPage({super.key, required this.chorist});

  final Chorist chorist;

  @override
  State<SancViewPage> createState() => _SancViewPageState();
}

class _SancViewPageState extends State<SancViewPage> {
  @override
  Widget build(BuildContext context) {
    Chorist chor = widget.chorist;
    return Scaffold(
      appBar: AppBar(
        title: Text(chor.lastName.toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: chor.sanctions
              .map((e) => ListTile(
                    title: Text(e.type),
                    subtitle: Text("Raison: ${e.raison}"),
                    isThreeLine: true,
                    trailing: IconButton(
                      onPressed: () {
                        chor.sanctions.remove(e);
                        chor.save();
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.check_circle),
                      color: Colors.green,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
