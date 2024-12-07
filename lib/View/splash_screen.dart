import 'package:e_commerce_application/Utils/color_scheme.dart';
import 'package:e_commerce_application/Utils/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashscreen = SplashServices();
 @override
  void initState() {
    splashscreen.isLogin(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
 
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: colorScheme.onPrimary,
      body: Stack(
        children: [
     
          Center(
            child: Container(
              width: 250.w,
              height:280.h,
              child: Image.asset(
                "images/splashscreen.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
            Positioned(
            bottom: 130.h, 
            left: 0,
            right: 0,
            child: Center(
              child: SpinKitCircle(color: primaryColor)
            ),
          ),

          Positioned(
            top: 50.h, 
            left: 0,
            right: 0,
            child: Text(
              "SwiftMart",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 33.sp,
                fontWeight: FontWeight.bold,
                color: primaryColor, 
              ),
            ),
          ),
          Positioned(
            bottom: 50.h, 
            left: 0,
            right: 0,
            child: Text(
              "Join Our Shopping Company",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: primaryColor.withOpacity(0.8), 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
