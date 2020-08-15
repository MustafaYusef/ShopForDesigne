import 'dart:convert';

import 'package:Shope_desgine/models/categoryModel.dart';
import 'package:Shope_desgine/models/feddResponse.dart';
import 'package:Shope_desgine/models/productsModel.dart';
import 'package:Shope_desgine/models/sendFeedbackBody.dart';
import 'package:http/http.dart';

import '../constans.dart';

class Repastory {
  Future<CategoryModel> getCategory() async {
    final response = await get(baseUrl + "categories");
    if (response.statusCode == 200) {
      return categoryModelFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  CategoryModel categoryModelFromJson(String str) =>
      CategoryModel.fromJson(json.decode(str));

  Future<ProductsModel> getProducts() async {
    final response = await get(baseUrl + "products");
    if (response.statusCode == 200) {
      return productsModelFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  ProductsModel productsModelFromJson(String str) =>
      ProductsModel.fromJson(json.decode(str));

  Future<ProductsModel> getProductByCategory(int id) async {
    final response = await get(baseUrl + "products?categoryId=$id");
    if (response.statusCode == 200) {
      return productsModelFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<FeedResponse> createFeedbck(SendFeedbackBody body) async {
    final response = await post(baseUrl + "feedback",
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "name": body.name,
          "email": body.email.toString(),
          "body": body.body,
          "phone": body.phone
        }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      //   print(json.decode(response.body)["message"]);
      return createReportResponseFromJson(response.body);
    } else {
      print(json.decode(response.body)["message"]);
      throw Exception(json.decode(response.body)["message"]);
    }
  }

  FeedResponse createReportResponseFromJson(String str) =>
      FeedResponse.fromJson(json.decode(str));
}
