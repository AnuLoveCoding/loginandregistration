import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import '/UserModel.dart';


class DbHelper {

  static Database? _db;

  //DataBase
  static const String DB_Name = 'StoreData.db';
  static const String Table_User = 'userData';
  static const int DB_Version = 1;

  //Column
  // static const String C_UserID='user_id';
  // static const String C_UserName='user_name';
  //static const String C_Email='email';
  //static const String C_Password='password';


  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await intiDb();
    return _db!;
  }

  intiDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, DB_Name);
    var db = await openDatabase(path, version: DB_Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "create table userData(user_id TEXT,user_name TEXT,email TEXT,password TEXT,PRIMARY KEY(user_id))");
  }

//Insert Data into Database
  Future<int> insertadata(Usermodel userData) async {
    var dbClient = await db;
    var result = await dbClient.insert("user", userData.toMap());
    return result;
  }

  //Login Form
  Future<Usermodel> getLoginPage(String email, String password) async {
    var dbClient = await db; //call the Database(Open the Database)
    var res = await dbClient.rawQuery("select * from user where email= '" + email + "' and password='" + password + "'");
     if (res.length > 0) {
      return Usermodel.fromMap(res.first);
    }
    return null!;
  }

}