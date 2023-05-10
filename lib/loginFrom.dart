import 'package:flutter/material.dart';
import '/DBhelper.dart';
import 'Singin.dart';
import 'package:loginandregistration/registratoinPage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{

  //SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
  final email_con=TextEditingController();
  final pass_con=TextEditingController();
  var   dbHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper=DbHelper();
    //get the value from Shared Prefrences.
    //Return String
    hh(context);
  }
  void hh(BuildContext context) async{

    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    /* String ?stringValue = prefs.getString('e');

    if(stringValue!=null){
     // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(_)=> Sign_in()), (route) => false);

    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(stringValue!)));
*/

  }

  sigin() async{
    String email=email_con.text;
    String pass=pass_con.text;
    await dbHelper.getLoginPage(email,pass).then((userdata) async {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Registered")));

      /*if(userdata!=null){*/
      /*   SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("e", email);*/
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(_)=> Sign_in()), (route) => false);
      /* }
      else{

      }*/
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Login form'),
      ),
       body: Container(
             child: Column(
              children: [
                Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: email_con,
                  decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        labelText: 'email',
                        icon: Icon(Icons.format_list_numbered),
                        iconColor: Colors.blueAccent,
                        fillColor: Colors.white
                    ),
                  ),
                ),
            Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: pass_con,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                fillColor: Colors.white,
                labelText: 'password',
                icon: Icon(Icons.drive_file_rename_outline_outlined),
                iconColor: Colors.blueAccent,

              ),
              obscureText: true,
            ),
          ),
          SizedBox(height:5,),
          ElevatedButton(
              onPressed: (){
                sigin;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Registered")));
              },
               child: Text('Sign in',style: TextStyle(fontWeight: FontWeight.w200,fontSize:20,),),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                       return Registration_Form();
                      }
                    )
                );
              },
              child:
                Text('Register For New User',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20,),)
          ),
        ],
       ),
    ),
  );

  }
}
