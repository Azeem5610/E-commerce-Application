import 'package:e_commerce_application/Utils/cutom_app_bar.dart';
import 'package:e_commerce_application/Utils/mybutton.dart';
import 'package:e_commerce_application/Utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth=FirebaseAuth.instance;
  bool isLoading=false;
  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
     setState(() {
       isLoading=true;
     });
     auth.sendPasswordResetEmail(email: _emailController.text).then((value){ 
         setState(() {
           isLoading=false;
         });
         Utils().toastMessage("Password reset link has been sent!");
     }).onError((error, stackTrace) {
      setState(() {
        isLoading=false;
      });
       Utils().toastMessage(error.toString());
     },);

     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Enter your email address to reset your password.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            SizedBox(height: 30.0),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email,color: Colors.red[400],),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20.0),
            Mybutton( 
              isLoading: isLoading,
              title: "Reset", func: _resetPassword),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to login screen
              },
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
