import 'package:flutter/material.dart';
import 'package:loginandregistration/screens/personalities.dart';

class firstPage extends StatelessWidget {

  List<String>name = ['Prime Ministers', 'Doctors', 'Actors'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Text('Categories of Personality'),
        centerTitle: true,
        backgroundColor: Color(0xff3a3e3e),
      ),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (BuildContext context, int pos){
          return GestureDetector(
            onTap: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context){
                    return Personalities(p: pos);
                   }
                  ),
                );
            },
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/flag.jpg'),fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  // Text(name[pos]),
              ],
            ),
          );
       }
      ),
    );
  }
}
