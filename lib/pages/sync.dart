// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class SyncPage extends StatefulWidget {
  const SyncPage({super.key});

  @override
  State<SyncPage> createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> {
  Future? initFire() async {
    try {
      return await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future? syncFire;

  @override
  void initState() {
    syncFire = initFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Synchronisation"),
      ),
      body: FutureBuilder(builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Center(
              child: Column(),
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("ERREUR"),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      })),
    );
  }
}
