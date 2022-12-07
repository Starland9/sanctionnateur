// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sanctionnateur/classes/chorist.dart';
import 'package:sanctionnateur/classes/sanction.dart';
import 'package:sanctionnateur/pages/home.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ChoristAdapter());
  Hive.registerAdapter(SanctionAdapter());

  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.openBox<Chorist>("chorists", path: dir.path);
  await Hive.openBox<Sanction>("sanctions", path: dir.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sanctionnateur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline2: TextStyle(
            color: Colors.blue,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: Colors.amber.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
