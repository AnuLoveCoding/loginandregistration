import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sign_in extends StatefulWidget {

  @override
  State<Sign_in> createState() => _Sign_inState();

}

class _Sign_inState extends State<Sign_in> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title:Text('Welcome',style: TextStyle(
          fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
          child: Center(child: Text('Welcome TO Your App',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)),
      ),
    );
  }
}
