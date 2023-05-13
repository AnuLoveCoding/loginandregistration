import 'package:flutter/material.dart';
import 'package:loginandregistration/screens/personalities.dart';

class firstPage extends StatelessWidget {

  List<String> namelist = ['Prime Minister\'s', 'Doctor\'s', 'Actor\'s'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff3a3e3e),
        title: Text('Categories of Personlaties'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: namelist.length,
              itemBuilder: (BuildContext context ,int pos){
                //  Replace with Gesturedectore and use InkWell;
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Personalities(p: pos);
                    }));
                  },
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //   margin: EdgeInsets.all(20.0),
                      //   constraints: BoxConstraints.expand(width: double.infinity,height: 100.0),
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(image: AssetImage('images/flag.jpg')),
                      //   ),
                      // ),
                      SizedBox(height: 10.0,),
                      Container(
                          width: double.infinity,
                          height: 150.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            border: Border.all(
                                color: Colors.deepOrange,
                                width: 5.0
                            ),
                          ),
                       child : Center(child: Text(namelist[pos],style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)))
                          // Image(image: AssetImage(ima[pos])),
                          // Text(namelist[pos]),
                          // SizedBox(height: 10.0,)
                      ),
                    ],
                  ),
                );
              }
          ),
        ),

    );
  }
}