import 'package:flutter/material.dart';

class firstPage extends StatefulWidget {

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {

  List<String> namelist = ['Prime Minister\'s', 'Doctor\'s', 'Actor\'s'];

  @override
  Widget build(BuildContext context) {
    var namelist;
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories of Personality'),
        centerTitle: true,
        backgroundColor: Color(0xff3a3e3e),
      ),
      body: ListView.builder(
          itemCount: namelist.length,
          itemBuilder: (BuildContext context, int pos){
          return GestureDetector(
            onTap: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context){
                    return namelist(p: pos);
                   }
                  ),
                );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(namelist[pos]),
              ],
            ),
          );
       }
      ),
    );
  }
}
