import 'package:flutter/material.dart';

class HimePage extends StatefulWidget {
  const HimePage({Key? key}) : super(key: key);

  @override
  State<HimePage> createState() => _HimePageState();
}

class _HimePageState extends State<HimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('home Page'),),);
  }
}
