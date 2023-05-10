import 'package:flutter/material.dart';
import '/DBhelper.dart';
import '/UserModel.dart';
import 'loginFrom.dart';
import 'Singin.dart';

class Registration_Form extends StatefulWidget {

  @override
  State<Registration_Form> createState() => _Signup_FormState();
}

class _Signup_FormState extends State<Registration_Form> {

  final _conid = TextEditingController();
  final _conname = TextEditingController();
  final _conemail = TextEditingController();
  final _conpass = TextEditingController();

  //Call the DataBase
  var dbhelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbhelper = DbHelper(); // call The dataBase
  }

  Signup() async {
    String id = _conid.text;
    String name = _conname.text;
    String email = _conemail.text;
    String pass = _conpass.text;
    String buttton = _conpass.text;

    Usermodel usermodel = Usermodel(
        user_id: id, user_name: name, user_email: email, user_password: pass);
        await dbhelper.insertadata(usermodel).then((userData) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("SucessFully Register")));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Data Failed")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.green[200],
          title: Center(child: Text('Registation Page',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
        ),
        body:Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/car.jpg'),fit: BoxFit.cover)
          ),
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: _conid,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'user Id',
                    icon: Icon(Icons.format_list_numbered),
                    iconColor: Colors.blueAccent,
                    fillColor: Colors.white
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: _conname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  fillColor: Colors.white,
                  labelText: 'Your Name',
                  icon: Icon(Icons.drive_file_rename_outline_outlined),
                  iconColor: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(height:5,),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: _conemail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                    iconColor: Colors.blueAccent,
                    fillColor: Colors.white
                ),
              ),
            ),
            SizedBox(height:5,),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: _conpass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blueAccent)
                  ),
                  hintStyle: TextStyle(color: Colors.deepPurple),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  icon: Icon(Icons.password_outlined),
                  iconColor: Colors.blueAccent,
                ),
                obscureText: true,),
            ),
            SizedBox(height:2,),
            Container(
                margin: EdgeInsets.all(20),
                child: Text('Welcome Back to app',style: TextStyle(fontSize: 20,fontWeight:
                FontWeight.bold,color: Colors.white,shadows: [Shadow(color: Colors.cyan,)]),)),
            SizedBox(height:2,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                    // Show more options
                  );
                },
                child: Text('Register Yourself', style:
                    TextStyle(fontWeight: FontWeight.w200,fontSize: 20,),
                ),
            ),
            SizedBox(height:4,),
            Text('Or Continue ',style: TextStyle(color: Colors.green[200],fontWeight: FontWeight.bold,fontSize: 20),),
            Container(
              height: 10,
              width: 120,
              child: Divider(
                thickness: 3,
                color: Colors.blue,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook,size: 40,color:Colors.white,),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            /* Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.g_mobiledata_rounded,size: 50,color: Colors.white,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>google()),
                 // Show more options
                );},
            ),
          ],
        ),*/
          ],
          ),
        )
    );
  }
}
