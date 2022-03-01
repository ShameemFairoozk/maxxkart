
import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
    required this.id,
    required this.proName,
    required this.price,
    required this.sellingPrice,
    required this.qty,
    required this.attribute,
    required this.image,
    required this.categoryId,
    required this.categoryName,
    required this.shopId,
    required this.companyName,
    required this.taluk,
    required this.longitude,
    required this.latitude,
  });

  String id;
  String proName;
  String price;
  String sellingPrice;
  String qty;
  String attribute;
  String image;
  String categoryId;
  String categoryName;
  String shopId;
  String companyName;
  String taluk;
  String longitude;
  String latitude;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    proName: json["pro_name"],
    price: json["price"],
    sellingPrice: json["selling_price"],
    qty: json["qty"],
    attribute: json["attribute"],
    image:'https://admin.maaxkart.com/'+ json["image"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    shopId: json["shop_id"],
    companyName: json["company_name"],
    taluk: json["taluk"],
    longitude: json["longitude"]??'',
    latitude: json["latitude"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pro_name": proName,
    "price": price,
    "selling_price": sellingPrice,
    "qty": qty,
    "attribute": attribute,
    "image": image,
    "category_id": categoryId,
    "category_name": categoryName,
    "shop_id": shopId,
    "company_name": companyName,
    "taluk": taluk,
    "longitude": longitude,
    "latitude": latitude,
  };
}
