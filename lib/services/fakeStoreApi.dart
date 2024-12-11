import 'dart:convert';
import 'package:ecom_fakestoreapi/models/product.dart';
import 'package:http/http.dart' as http;

class FakeStoreApi {
  static const String baseURL = 'https://fakestoreapi.com';

  static Future<List<String>> getAllCategories() async {
    try {
      final response =
          await http.get(Uri.parse('$baseURL/products/categories'));
      if (response.statusCode == 200) {
        List<dynamic> categoriesJson = json.decode(response.body);
        return categoriesJson.map((category) => category.toString()).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  static Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final response =
          await http.get(Uri.parse('$baseURL/products/category/$category'));
      if (response.statusCode == 200) {
        List<dynamic> productsJson = json.decode(response.body);
        return productsJson
            .map((product) => Product.fromJson(product))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  static Future<List<Product>> getProductsByCategoryWithPagination(
      String category, int limit, int offset) async {
    try {
      final response = await http.get(Uri.parse(
          '$baseURL/products/category/$category?limit=$limit&offset=$offset'));
      if (response.statusCode == 200) {
        List<dynamic> productsJson = json.decode(response.body);
        return productsJson
            .map((product) => Product.fromJson(product))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  static Future<List<Product>> getAllProductsWithPagination(
      int limit, int offset) async {
    try {
      final response = await http
          .get(Uri.parse('$baseURL/products?limit=$limit&offset=$offset'));
      if (response.statusCode == 200) {
        List<dynamic> productsJson = json.decode(response.body);
        return productsJson
            .map((product) => Product.fromJson(product))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
