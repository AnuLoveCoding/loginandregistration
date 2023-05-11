import 'package:flutter/material.dart';
import '/DBhelper.dart';
import 'Singin.dart';
import 'package:loginandregistration/registratoinPage.dart';

class LoginForm extends StatefulWidget {

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
  }

  sigin() async{
    String email = email_con.text;
    String pass=pass_con.text;
    await dbHelper.getLoginPage(email,pass).then((userdata) async {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Sucessfully")));
      /*if(userdata!=null){*/
      /*   SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("e", email);*/
     // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(_)=> Sign_in()), (route) => false);
      /* }
      else{

      }*/
      Navigator.push(context, MaterialPageRoute(builder: (context) =>Sign_in()),);
     }
    );
  }

  Widget feilds({required String name, required var controller, required IconData icon}){
    return Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        controller: controller,
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
   }
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Login form'),
      ),
       body: Column(
        children: [
           feilds(name: 'E_mail', controller: email_con, icon: (Icons.format_list_numbered)),
           feilds(name: 'Password', controller: pass_con, icon: (Icons.password)),
          SizedBox(height:5,),
          ElevatedButton( onPressed: (){
            sigin();
           // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Registered")));
            },
            child: Text('Sign in',style: TextStyle(fontWeight: FontWeight.w200,fontSize:20,),),
          ),
          ElevatedButton(
           onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  Registration_Form())),
            child: Text('Register For New User',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20,),)
           ),
         ],
        ),
   );

  }
}
