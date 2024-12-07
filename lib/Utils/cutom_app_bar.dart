import 'package:e_commerce_application/Utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
   VoidCallback? onTap;
    CustomAppBar({super.key, required this.title,this.onTap, List<IconButton>?actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorScheme.primary,
      actions: [ 
        IconButton(onPressed: onTap, icon: Icon(Icons.logout,color: Colors.red[800],size: 30,))
      ],
      title: Text(
        title,
        style: TextStyle(
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 23.sp,
        ),
      ),
      centerTitle: true, 
      elevation: 4.h, 
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
