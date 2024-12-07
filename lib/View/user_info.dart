import 'package:e_commerce_application/Utils/toast_message.dart';
import 'package:e_commerce_application/View/Auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoPage extends StatelessWidget {
  final Map<String, dynamic>? userData;

  UserInfoPage({super.key, this.userData});

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text("User Information"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              auth.signOut().then((value) {
                Utils().toastMessage("Logged out");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }).onError((error, stackTrace) {
                Utils().toastMessage("Error");
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${userData?['name'] ?? 'N/A'}",
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              "Email: ${userData?['email'] ?? 'N/A'}",
              style: TextStyle(fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
