import 'package:flutter/material.dart';
import 'package:loginandregistration/screens/UserModel.dart';

class Personalities extends StatelessWidget {

  final int p;

  Personalities({required  this.p});

  List<Modelclass> prime = [
    Modelclass(name: 'Narender Modi', imagee: 'images/modi.jpg'),
    Modelclass(name: 'Atal Bihari Vajypee', imagee: 'images/atal.jpg'),
  ];

  List<Modelclass> doc = [
    Modelclass(name: 'Harsh Vardhan', imagee: 'images/vardhan.jpg'),
    Modelclass(name: 'Mansukh Mandviyua', imagee: 'images/mansukh.jpg'),
  ];

  List<Modelclass> actor = [
    Modelclass(name: 'Salman Khan', imagee: 'images/salmankhan.jpg'),
    Modelclass(name: 'Akshay Kumar', imagee: 'images/AkshayKumar.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3a3e3e),
          title: Text('Personalities'.toUpperCase(),style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),

        body: Column(
          children: [
            if(p == 0)...[
              Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(20.0),
                    child: ListView.builder(
                        itemCount: prime.length,
                        itemBuilder: (BuildContext context, int pos){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(prime[pos].imagee),width: double.infinity,height: 200.0,),
                              Text(prime[pos].name),
                              SizedBox(height: 20.0,),
                            ],
                          );
                        }
                    ),
                  )
              ),
            ]else if(p == 1)...[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(20.0),
                  child: ListView.builder(
                      itemCount: doc.length,
                      itemBuilder: (BuildContext context, int pos){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(doc[pos].imagee),width: double.infinity,height: 200.0,),
                            Text(doc[pos].name),
                            SizedBox(height: 20.0,)
                          ],
                        );
                      }
                  ),
                ),
              ),
            ] else if(p == 2)...[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(20.0),
                  child: ListView.builder(
                      itemCount: actor.length,
                      itemBuilder: (BuildContext context , int pos){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(actor[pos].imagee,),width: double.infinity,height: 200.0,),
                            Text(actor[pos].name),
                            SizedBox(height: 20.0,)
                          ],
                        );
                      }
                  ),
                ),
              ),
            ],
          ],
        )
    );
  }
}
