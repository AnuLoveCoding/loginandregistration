class Usermodel{

  String ?user_id;
  String ?user_name;
  String ?user_email;
  String ?user_password;

  Usermodel({required this.user_id, required this.user_name,required this.user_email, required this.user_password});

  // For send the data for Registration form only;
  Map<String, dynamic>toMap(){
    var map = <String, dynamic>{
      'user_id' : user_id,
      'user_name' : user_name,
      'email' : user_email,
      'password': user_password,
    };
    return map;
  }

//
Usermodel.fromMap(Map<String, dynamic>map){
    user_id = map['user_id'];
    user_name = map['user_name'];
    user_email = map['email'];
    user_password = map['password'];
  }
}

