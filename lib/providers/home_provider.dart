import 'package:flutter/cupertino.dart';
import 'package:maxxkart_flutter/models/product_details_model.dart';
import 'package:maxxkart_flutter/models/products_model.dart';
import 'package:maxxkart_flutter/services/api_service.dart';

class HomeProvider extends ChangeNotifier{
List<ProductsModel> productList=[];
List<ProductsModel> filteredList=[];
ProductsDetailsModel? productsDetailsModel;


HomeProvider(){
  getProducts();
}

  Future<void> getProducts() async {
  productList= await ApiService().getProduct();
  print(productList.length);
  filteredList= productList;

  notifyListeners();
  }

  void onSearchItem(String item) {
    filteredList = productList
        .where((element) => element.proName.toLowerCase()
        .contains(
        item.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void getProductDetails(String id) async {
    productsDetailsModel=null;
    productsDetailsModel=await ApiService().getProductDetails(id);
    notifyListeners();

  }

  void increment() {
    productsDetailsModel!.cartQty=(int.parse(productsDetailsModel!.cartQty)+1).toString();
    productsDetailsModel!.total=(double.parse(productsDetailsModel!.cartQty)*double.parse(productsDetailsModel!.sellingPrice)).toString();
    notifyListeners();

  }

  void decrement() {
    productsDetailsModel!.cartQty=(int.parse(productsDetailsModel!.cartQty)-1).toString();
    productsDetailsModel!.total=(double.parse(productsDetailsModel!.cartQty)*double.parse(productsDetailsModel!.sellingPrice)).toString();

    notifyListeners();

  }
}