import 'package:flutter/material.dart';
import 'package:loginandregistration/screens/Firstpage.dart';
import 'package:loginandregistration/screens/UserModel.dart';
import 'package:loginandregistration/screens/loginFrom.dart';
import '/DBhelper.dart';


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


    Usermodel usermodel = Usermodel(
        user_id: id, user_name: name, user_email: email, user_password: pass);
        await dbhelper.insertadata(usermodel).then((user) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Sucessfully Register")));
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginForm()));
        }).catchError((error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Failed"))));
  }

  Widget controllerid({required String name, required var controller, required IconData icon, required bool obscureText}) =>
     Container(
        margin: EdgeInsets.all(20),
        child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            labelText: name,
            icon: Icon(icon,color: Colors.blueAccent),
            fillColor: Colors.white
        ),
      ),
     );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Center(child: Text('Registation Page',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             controllerid(name: 'id', controller: _conid, icon: (Icons.format_list_numbered),obscureText: false),
             controllerid(name: 'Your Name', controller: _conname, icon: (Icons.drive_file_rename_outline_outlined),obscureText: false),
             controllerid(name: 'E_mail', controller: _conemail, icon: (Icons.email),obscureText: false),
             controllerid(name: 'Password', controller: _conpass, icon: (Icons.password_outlined),obscureText: true),
            Container(
                margin: EdgeInsets.all(20),
                child: Text('Welcome Back to app',style: TextStyle(fontSize: 20,fontWeight:
                FontWeight.bold,color: Colors.black,shadows: [Shadow(color: Colors.cyan,)]),
                )
            ),
             SizedBox(height:2,),
             ElevatedButton(
                onPressed: (){
                 Signup();
                },
                child: Text('Register Yourself', style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20,),),
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
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //   icon: Icon(Icons.g_mobiledata_rounded,size: 50,color: Colors.white,),
                    // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => google()),),
                  // ),
                ],
            ),
           ],
          ),
    );
  }
}
