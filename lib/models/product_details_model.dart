

import 'package:meta/meta.dart';
import 'dart:convert';

ProductsDetailsModel productsDetailsModelFromJson(String str) => ProductsDetailsModel.fromJson(json.decode(str));

String productsDetailsModelToJson(ProductsDetailsModel data) => json.encode(data.toJson());

class ProductsDetailsModel {
  ProductsDetailsModel({
    required this.id,
    required this.companyId,
    required this.productId,
    required this.categoryId,
    required this.subcatId,
    required this.price,
    required this.sellingPrice,
    required this.qty,
    required this.status,
    required this.company,
    required this.proName,
    required this.image,
    required this.attribute,
    required this.orderBy,
    required this.createdDate,
    required this.createdTime,
    required this.updatedDate,
    required this.updatedTime,
    required this.category,
    required this.inCart,
    required this.cartQty,
    required this.total,
  });

  String id;
  String companyId;
  String productId;
  String categoryId;
  String subcatId;
  String price;
  String sellingPrice;
  String qty;
  String status;
  String company;
  String proName;
  String image;
  String attribute;
  String orderBy;
  DateTime createdDate;
  String createdTime;
  DateTime updatedDate;
  String updatedTime;
  String category;
  String inCart;
  String cartQty;
  String total;

  factory ProductsDetailsModel.fromJson(Map<String, dynamic> json) => ProductsDetailsModel(
    id: json["id"],
    companyId: json["company_id"],
    productId: json["product_id"],
    categoryId: json["category_id"],
    subcatId: json["subcat_id"],
    price: json["price"],
    sellingPrice: json["selling_price"],
    qty: json["qty"],
    status: json["status"],
    company: json["company"],
    proName: json["pro_name"],
    image: 'https://admin.maaxkart.com/'+json["image"],
    attribute: json["attribute"],
    orderBy: json["order_by"],
    createdDate: DateTime.parse(json["created_date"]),
    createdTime: json["created_time"],
    updatedDate: DateTime.parse(json["updated_date"]),
    updatedTime: json["updated_time"],
    category: json["category"],
    inCart: json["in_cart"],
    cartQty: '0',
    total: '0'
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "product_id": productId,
    "category_id": categoryId,
    "subcat_id": subcatId,
    "price": price,
    "selling_price": sellingPrice,
    "qty": qty,
    "status": status,
    "company": company,
    "pro_name": proName,
    "image": image,
    "attribute": attribute,
    "order_by": orderBy,
    "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
    "created_time": createdTime,
    "updated_date": "${updatedDate.year.toString().padLeft(4, '0')}-${updatedDate.month.toString().padLeft(2, '0')}-${updatedDate.day.toString().padLeft(2, '0')}",
    "updated_time": updatedTime,
    "category": category,
    "in_cart": inCart,
    "cart_qty": cartQty,
    "'total'": total,
  };
}
