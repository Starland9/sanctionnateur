// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sanctionnateur/pages/appel_list.dart';
import 'package:sanctionnateur/pages/chor_list.dart';
import 'package:sanctionnateur/pages/sanc_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "LE SANCTIONNATEUR",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                HomeBtn(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChorListPage(),
                        ),
                      );
                    },
                    text: "Liste des Choristes",
                    color: Colors.green),
                HomeBtn(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppelPage(),
                          ));
                    },
                    text: "Faire l'appel",
                    color: Colors.purple),
                HomeBtn(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SnactionsListPage(),
                          ));
                    },
                    text: "Voir les sanctions",
                    color: Colors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HomeBtn extends StatelessWidget {
  const HomeBtn({
    Key? key,
    required this.onPress,
    required this.text,
    required this.color,
  }) : super(key: key);

  final void Function()? onPress;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPress,
        // ignore: sort_child_properties_last
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(text.toUpperCase()),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          fixedSize: MaterialStatePropertyAll(
            Size(250, 40),
          ),
        ),
      ),
    );
  }
}
