import 'dart:async';  


import '../../data/CtrQuery/login_ctr.dart';
import '../../models/user.dart';  
  
class LoginRequest {  
  LoginCtr con = new LoginCtr();  
  
 Future getLogin(String username, String password) {  
    var result = con.getLogin(username,password);  
    return result;  
  }  
} 