import 'dart:convert';
import 'package:e_commerce_application/Modals/get_categories_model.dart';
import 'package:e_commerce_application/Modals/get_laptops_modal.dart';
import 'package:e_commerce_application/Modals/get_men_shirts_modal.dart';
import 'package:e_commerce_application/Modals/get_men_shoes_modal.dart';
import 'package:e_commerce_application/Modals/get_men_watches.dart';
import 'package:e_commerce_application/Modals/get_mobile-accessories_modal.dart';
import 'package:e_commerce_application/Modals/get_smartphones_model.dart';
import 'package:e_commerce_application/Modals/get_tablets_modal.dart';
import 'package:e_commerce_application/Modals/get_womendresses_modal.dart';
import 'package:e_commerce_application/Modals/get_womenjewellery_modal.dart';
import 'package:e_commerce_application/Modals/get_womensbags_modal.dart';
import 'package:e_commerce_application/Modals/get_womenshoes_modal.dart';
import 'package:e_commerce_application/Modals/get_womenwatches_modal.dart';
import 'package:http/http.dart' as http;

class ECommerceApiServices {

   String baseUrl='https://dummyjson.com/products/category';

   Future<List<GetCategoriesModel>> getCategories() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products/categories'));

  if (response.statusCode == 200) {
    final List<dynamic> body = jsonDecode(response.body);
   
    final List<String> allowedCategories = [
      'laptops',
      'tablets',
      'mobile-accessories',
      'smartphones',
      'mens-shoes',
      'mens-watches',
      'mens-shirts',
      'womens-bags',
      'womens-dresses',
      'womens-jewellery',
      'womens-shoes',
      'womens-watches',
    ];

    return body
        .map((json) => GetCategoriesModel.fromJson(json))
        .where((category) => allowedCategories.contains(category.slug))
        .toList();
  } else {
    throw Exception('Failed to load categories');
  }
}


  Future<GetSmartphonesModel> getSmartPhones() async {
  String URL = '$baseUrl/smartphones';
  try {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      
      print(response.body);
      return GetSmartphonesModel.fromJson(body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    print('Error occurred: $error');
    throw Exception('Something went wrong while fetching data');
  }
}
 
    Future<GetLaptopsModel>getLaptops()async{ 
      String URL='$baseUrl/laptops';
      try{ 
        final response=await http.get(Uri.parse(URL));
        if(response.statusCode==200){ 
          final body=jsonDecode(response.body);
          print(response.body);
          return GetLaptopsModel.fromJson(body);
        }else{ 
          throw Exception('Failed to load data: ${response.statusCode}');
        }
      }catch(e){ 
        print('Error occurred: $e');
    throw Exception('Something went wrong while fetching data');
      }
    }

    Future<GetTabletsModel> getTablets() async {
  String URL = '$baseUrl/tablets';
  try {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(response.body);
      return GetTabletsModel.fromJson(body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    print('Error occurred: $error');
    throw Exception('Something went wrong while fetching data');
  }
}
 
    Future<GetMobileAccessoriesModel>getMobileAccessories()async{ 
      String URL='$baseUrl/mobile-accessories';
      try{ 
        final response=await http.get(Uri.parse(URL));
        if(response.statusCode==200){ 
          final body=jsonDecode(response.body);
          print(response.body);
          return GetMobileAccessoriesModel.fromJson(body);
        }else{ 
          throw Exception('Failed to load data: ${response.statusCode}');
        }
      }catch(e){ 
        print('Error occurred: $e');
    throw Exception('Something went wrong while fetching data');
      }
    }

    Future<GetMenShirtsModel> getMensShirts() async {
  String URL = '$baseUrl/mens-shirts';
  try {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(response.body);
      return GetMenShirtsModel.fromJson(body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    print('Error occurred: $error');
    throw Exception('Something went wrong while fetching data');
  }
}
 
    Future<GetMenShoesModel>getMenShoes()async{ 
      String URL='$baseUrl/mens-shoes';
      try{ 
        final response=await http.get(Uri.parse(URL));
        if(response.statusCode==200){ 
          final body=jsonDecode(response.body);
          print(response.body);
          return GetMenShoesModel.fromJson(body);
        }else{ 
          throw Exception('Failed to load data: ${response.statusCode}');
        }
      }catch(e){ 
        print('Error occurred: $e');
    throw Exception('Something went wrong while fetching data');
      }
    }

    Future<GetMenWatchesModel> getMenWatch() async {
  String URL = '$baseUrl/mens-watches';
  try {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(response.body);
      return GetMenWatchesModel.fromJson(body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    print('Error occurred: $error');
    throw Exception('Something went wrong while fetching data');
  }
}
 
    Future<GetWomanJewelleryModel>getWomenJewellery()async{ 
      String URL='$baseUrl/womens-jewellery';
      try{ 
        final response=await http.get(Uri.parse(URL));
        if(response.statusCode==200){ 
          final body=jsonDecode(response.body);
          print(response.body);
          return GetWomanJewelleryModel.fromJson(body);
        }else{ 
          throw Exception('Failed to load data: ${response.statusCode}');
        }
      }catch(e){ 
        print('Error occurred: $e');
    throw Exception('Something went wrong while fetching data');
      }
    }

    Future<GetWomanBagsModel> getWomenBags() async {
  String URL = '$baseUrl/womens-bags';
  try {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(response.body);
      return GetWomanBagsModel.fromJson(body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    print('Error occurred: $error');
    throw Exception('Something went wrong while fetching data');
  }
}
 
    Future<GetWomanShoesModel>getWomenShoes()async{ 
      String URL='$baseUrl/womens-shoes';
      try{ 
        final response=await http.get(Uri.parse(URL));
        if(response.statusCode==200){ 
          final body=jsonDecode(response.body);
          print(response.body);
          return GetWomanShoesModel.fromJson(body);
        }else{ 
          throw Exception('Failed to load data: ${response.statusCode}');
        }
      }catch(e){ 
        print('Error occurred: $e');
    throw Exception('Something went wrong while fetching data');
      }
    }

    Future<GetWomanWacthesModel> getWomenWatches() async {
  String URL = '$baseUrl/womens-watches';
  try {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(response.body);
      return GetWomanWacthesModel.fromJson(body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    print('Error occurred: $error');
    throw Exception('Something went wrong while fetching data');
  }
}
 
    Future<GetWomenDressesModel>getWomenDresses()async{ 
      String URL='$baseUrl/womens-dresses';
      try{ 
        final response=await http.get(Uri.parse(URL));
        if(response.statusCode==200){ 
          final body=jsonDecode(response.body);
          print(body);
          return GetWomenDressesModel.fromJson(body);
        }else{ 
          throw Exception('Failed to load data: ${response.statusCode}');
        }
      }catch(e){ 
        print('Error occurred: $e');
    throw Exception('Something went wrong while fetching data');
      }
    }
}