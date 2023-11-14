import 'package:test10/pages/drawer/drawer.dart';
import 'package:test10/shared/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrond,
        appBar: AppBar(),
        drawer: const myDrawer());
  }
}
