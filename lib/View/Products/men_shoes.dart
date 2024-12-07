import 'package:e_commerce_application/Modals/get_men_shoes_modal.dart';
import 'package:e_commerce_application/Utils/color_scheme.dart';
import 'package:e_commerce_application/Utils/cutom_app_bar.dart';
import 'package:e_commerce_application/Utils/product_card.dart';
import 'package:e_commerce_application/Services/e_commerce_api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../product_detail_widget.dart';

class MensShoesPage extends StatefulWidget {
  const MensShoesPage({super.key});

  @override
  State<MensShoesPage> createState() => _MensShoesPageState();
}

class _MensShoesPageState extends State<MensShoesPage> {
   Future<GetMenShoesModel> apiServices=ECommerceApiServices().getMenShoes();
   @override
  void initState() {
    apiServices;
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Men-Shoes"),
        body: FutureBuilder<GetMenShoesModel>(

        future:apiServices,
        builder: (context,AsyncSnapshot<GetMenShoesModel> snapshot) {
          if(!snapshot.hasData){ 
              return Center(child: SpinKitCircle(color: colorScheme.primary,));
          }else if(snapshot.connectionState==ConnectionState.waiting){ 
              return Center(child: SpinKitCircle(color: colorScheme.primary,));
          }
          return Padding(
          padding:const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: snapshot.data!.products!.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7, 
            ),
      
            itemBuilder: (context, index) {
            final data=snapshot.data!.products![index];
              return ProductCard(
                image: data.thumbnail.toString(),  title: data.title.toString(), price: "\$${data.price}",
                 brand: data.brand.toString(), onTap:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailWidget(
                images: 
                  data.images??[],
                 title:data.title.toString() ,
                  description: data.description.toString(),
                   price: data.price.toString(),
                    brand: data.brand.toString(), rating:data.rating??0.0,
                    category: data.category.toString(),
 
                     )
                     )
                     );
                 },
                 );
            },
          ),
        );
        },
        
      ),
    );
  }
}