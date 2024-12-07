import 'package:e_commerce_application/View/Auth/forget_password.dart';
import 'package:e_commerce_application/View/home_page.dart';
import 'package:e_commerce_application/Utils/mybutton.dart';
import 'package:e_commerce_application/View/Auth/sign_up_page.dart';
import 'package:e_commerce_application/Utils/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading=false;
  final emailC=TextEditingController();
    final passC=TextEditingController();
    final formKey=GlobalKey<FormState>();
    FirebaseAuth auth=FirebaseAuth.instance;
  
     void login(){ 
      if(formKey.currentState!.validate()){ 
        setState(() {
          isLoading=true;
        });
      }
      auth.signInWithEmailAndPassword(email: emailC.text, password: passC.text).then((value){ 
        setState(() {
          isLoading=false;
        });
        Utils().toastMessage("Sign in successfully");
        Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage(),));

      }).onError((error, stackTrace) {
        setState(() {
          isLoading=false;
        });
        Utils().toastMessage(error.toString());
      },);
     }




  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CircleAvatar(
                radius: 50.r,
                backgroundColor: colorScheme.primary,
                child: Icon(
                  Icons.shopping_bag_rounded,
                  color: colorScheme.onPrimary,
                  size: 50.dm,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Welcome Back!',
                style: TextStyle(
                 
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.7),
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 32.h),
              Form(
                key: formKey,
                child: Column( 
                children: [ 
                  TextFormField( 
                    controller: emailC,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: colorScheme.onSurface),
                  filled: true,
                  fillColor: colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: colorScheme.primary.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                  prefixIcon: Icon(Icons.email_outlined, color: colorScheme.primary),
                  
                ),
                 validator: (value) {
                   if(value==null||value.isEmpty){
                      return 'Enter the email';
                   }else if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){ 
                      return 'Enter a valid Email';
                   }
                   return null;
                 },
                  ),
                  SizedBox(height: 16.h),
                  TextFormField( 
                     controller: passC,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: colorScheme.onSurface),
                  filled: true,
                  fillColor: colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: colorScheme.primary.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                  prefixIcon: Icon(Icons.lock_outline, color: colorScheme.primary),
                ),
               validator: (value) {
                 if(value==null||value.isEmpty){ 
                  return 'Enter the password';
                 }else if(value.length<6){ 
                  return 'Password must be at least 6 characters';
                 }
                 return null;
               },
                  ),
                  SizedBox(height: 16.h),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () { 
                      Navigator.push(context, MaterialPageRoute(builder:(context) => ForgotPasswordPage(),));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: colorScheme.secondary),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              
              Mybutton(
                isLoading: isLoading,
                title: "Sign In", func:login
                ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: colorScheme.onSurface.withOpacity(0.7)),
                  ),
                  TextButton(
                    onPressed: () { 
                      Navigator.push(context, MaterialPageRoute(builder:(context) => SignUpPage(),));
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: colorScheme.secondary),
                    ),
                  ),
                ],
              ),
                ],
              )),  
            ],
          ),
        ),
      ),
    );
  }
}
