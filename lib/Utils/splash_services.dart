import 'dart:async';

import 'package:e_commerce_application/View/home_page.dart';
import 'package:e_commerce_application/View/Auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashServices { 
  void isLogin(context){ 
    FirebaseAuth auth=FirebaseAuth.instance;
    final user=auth.currentUser;
     if(user!=null){ 
      Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => HomePage(),)));
       
     }else{ 
      Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => LoginPage(),)));
     }

  }
    
    
}