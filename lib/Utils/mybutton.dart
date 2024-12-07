import 'package:e_commerce_application/Utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mybutton extends StatefulWidget {
 final String title;
  final VoidCallback func;
  final bool isLoading;
  const Mybutton({
   super.key,
    required this.title,
   required this.func,
     this.isLoading=false,
  });

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
         onPressed: widget.func,
        style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
     
         )
        ),
         child:widget.isLoading?Center(child: CircularProgressIndicator(color: Colors.blue[800],)):Text(widget.title,style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,)
        ));
    
  }
}