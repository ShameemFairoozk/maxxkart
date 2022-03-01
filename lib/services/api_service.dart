import 'dart:convert';

import 'package:maxxkart_flutter/models/product_details_model.dart';
import 'package:maxxkart_flutter/models/products_model.dart';
import 'package:http/http.dart' as http;

class ApiService{


  Future<List<ProductsModel>> getProduct() async {

    List<ProductsModel> productModel=[];

    var client=http.Client();


    try {
      var response = await client.post(Uri.parse("https://mobi.maaxkart.com/call-back-products-by-loc"), body: {'location_id': '429'});

      if (response.statusCode == 200) {

        List jsonResponse = json.decode(response.body);
        productModel=jsonResponse.map((job) => ProductsModel.fromJson(job)).toList();
        return productModel;
      }
    }
    catch(exp){
      print(exp);
      return productModel;

    }

    return productModel;

  }
  Future<ProductsDetailsModel>? getProductDetails(id) async {

    var productModel;

    var client=http.Client();

    try {
      final Map<String, dynamic> body = {
        'product_id': id,
        'cust_id':'17'
      };

      var response = await client.post(Uri.parse("https://mobi.maaxkart.com/call-back-product-by-id"), body: body);

      if (response.statusCode == 200) {
        var jsonString = response.body;

        var jsonMap = json.decode(jsonString);
        productModel = ProductsDetailsModel.fromJson(jsonMap);
        return productModel;
      }
    }
    catch(exp){
      return productModel;

    }

    return productModel;

  }
}