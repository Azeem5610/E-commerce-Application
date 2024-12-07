import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_application/Utils/mybutton.dart';
import 'package:e_commerce_application/Utils/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignUpPage extends StatefulWidget {

  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  
  final formKey = GlobalKey<FormState>();
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final confirmPassC = TextEditingController();
  bool isLoading=false;
  File? _selectedImage;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

 void signUp() async {
  if (formKey.currentState!.validate()) {
    setState(() {
      isLoading = true;
    });

    try {
      // Create user in Firebase Auth
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailC.text,
        password: passC.text,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': nameC.text,
        'email': emailC.text,
      });

      Utils().toastMessage("Sign Up successfully");
      Navigator.pop(context);
    } catch (error) {
      Utils().toastMessage(error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              
              Stack(
                children: [
                 
                  CircleAvatar(
                    radius: 60.r,
                    backgroundColor: colorScheme.primary.withOpacity(0.2),
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!) as ImageProvider
                        : null,
                    child: _selectedImage == null
                        ? Icon(Icons.person, size: 60.sp, color: colorScheme.primary)
                        : null,
                  ),
                  
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 17.r,
                        backgroundColor: colorScheme.primary,
                        child: Icon(
                          _selectedImage == null ? Icons.camera_alt : Icons.edit,
                          size: 20.sp,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

             
              Text(
                'Create an Account',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Sign up to get started',
                style: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.7),
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 32.h),

              // Form Section
              Form(
                key: formKey,
                child: Column(
                  children: [
                    _buildTextField(
                      controller: nameC,
                      labelText: 'Full Name',
                      icon: Icons.person,
                      colorScheme: colorScheme,
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      controller: emailC,
                      labelText: 'Email',
                      icon: Icons.email,
                      colorScheme: colorScheme,
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      controller: passC,
                      labelText: 'Password',
                      icon: Icons.lock,
                      obscureText: true,
                      colorScheme: colorScheme,
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      controller: confirmPassC,
                      labelText: 'Confirm Password',
                      icon: Icons.lock,
                      obscureText: true,
                      colorScheme: colorScheme,
                    ),
                    SizedBox(height: 24.h),

             
                     Mybutton(
                      isLoading: isLoading,
                      title: "Create Account",
                      func: signUp,
                    ),
                    
                    SizedBox(height: 16.h),

          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: colorScheme.onSurface.withOpacity(0.7),
                            fontSize: 14.sp,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: colorScheme.secondary,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required ColorScheme colorScheme,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: colorScheme.primary),
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
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}
