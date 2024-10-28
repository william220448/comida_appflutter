import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:comida_appflutter/models/category_model.dart';

class CategoryRepository {
  final Dio _dio = Dio();

  Future<List<CategoryModel>> getCategories() async {
    const String url = 'https://www.themealdb.com/api/json/v1/1/categories.php';

    try {
      final response = await _dio.get(url);
      final data = response.data['categories'] as List;

      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al obtener las categorías: $e');
    }
  }
}
