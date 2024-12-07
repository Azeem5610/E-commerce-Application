import 'package:e_commerce_application/Utils/color_scheme.dart';
import 'package:e_commerce_application/Utils/cutom_app_bar.dart';
import 'package:e_commerce_application/Utils/toast_message.dart';
import 'package:e_commerce_application/View/Products/laptops.dart';
import 'package:e_commerce_application/View/Auth/login_page.dart';
import 'package:e_commerce_application/View/Products/men_shirts.dart';
import 'package:e_commerce_application/View/Products/men_shoes.dart';
import 'package:e_commerce_application/View/Products/men_watches.dart';
import 'package:e_commerce_application/View/Products/mobile_accessories.dart';
import 'package:e_commerce_application/View/Products/smartphones.dart';
import 'package:e_commerce_application/View/Products/tablets.dart';
import 'package:e_commerce_application/View/Products/women_bags.dart';
import 'package:e_commerce_application/View/Products/women_dresses.dart';
import 'package:e_commerce_application/View/Products/women_jewellery.dart';
import 'package:e_commerce_application/View/Products/women_shoes.dart';
import 'package:e_commerce_application/View/Products/women_watches.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Welcome",onTap: () {
        auth.signOut().then((value){ 
          Utils().toastMessage("Logged out");
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LoginPage(),));
        }).onError((error, stackTrace) {
          Utils().toastMessage("Error");
        },);
      },),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10).r,
              height: 180.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: const DecorationImage(
                  image: AssetImage("images/banner.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
             Padding(
              padding:const EdgeInsets.all(8.0).r,
              child: Text(
                "Men Shopping",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
            ),
            buildCategoryGrid(context, [
              {
                "title": "Men's Shoes",
                "imagePath": "images/shoes.png",
                "page":const MensShoesPage(),
              },
              {
                "title": "Men's Watches",
                "imagePath": "images/watches.png",
                "page": const MenWatchesPage(),
              },
              {
                "title": "Men's Shirts",
                "imagePath": "images/shirts.png",
                "page": MensShirtsPage(),
              },
            ]),
            // Women Shopping Section
             Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: Text(
                "Women Shopping",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
            ),
            buildCategoryGrid(context, [
              {
                "title": "Women's Bags",
                "imagePath": "images/bags.png",
                "page": const WomensBagsPage(),
              },
              {
                "title": "Women's Dresses",
                "imagePath": "images/dresses.png",
                "page": const WomensDressesPage(),
              },
              {
                "title": "Women's Jewellery",
                "imagePath": "images/jewellery.png",
                "page": const WomensJewelleryPage(),
              },
               {
                "title": "Women's Shoes",
                "imagePath": "images/wshoes.png",
                "page": const WomensShoesPage(),
              },
              {
                "title": "Women's Watches",
                "imagePath": "images/wwatches.png",
                "page": const WomensWatchesPage(),
              },
            ]),

             Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: Text(
                "Gadgets Shopping",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
            ),
            buildCategoryGrid(context, [
              {
                "title": "Laptops",
                "imagePath": "images/laptops.png",
                "page": const LaptopsPage(),
              },
              {
                "title": "Tablets",
                "imagePath": "images/tablets.png",
                "page": const TabletsPage(),
              },
              {
                "title": "Mobile Accessories",
                "imagePath": "images/accessories.png",
                "page": const AccessoriesPage(),
              },
              {
                "title": "Smartphones",
                "imagePath": "images/phones.png",
                "page":const SmartphonesPage(),
              },
            ]
            ),
          ],
        ),
      ),
    );
  }

 Widget buildCategoryGrid(
    BuildContext context, List<Map<String, dynamic>> categories) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, 
      crossAxisSpacing: 10.w,
      mainAxisSpacing: 10.h,
      childAspectRatio: 3 / 2, 
    ),
    itemCount: categories.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => categories[index]['page'],
            ),
          );
        },
        child: Stack(
          children: [
            // Image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  image: AssetImage(categories[index]['imagePath']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Text overlay
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),
                  ),
                ),
                child: Text(
                  categories[index]['title']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
}

