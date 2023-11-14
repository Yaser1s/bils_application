import 'package:flutter/material.dart';

class DriversDesign extends StatefulWidget {
  final Map data;
  const DriversDesign({super.key, required this.data});

  @override
  State<DriversDesign> createState() => _DriversDesignState();
}

class _DriversDesignState extends State<DriversDesign> {
  @override
  Widget build(BuildContext context) {
    return const Text("data");
  }
}
