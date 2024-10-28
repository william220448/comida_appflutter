import 'package:comida_appflutter/models/meal_model.dart';
import 'package:dio/dio.dart';

class MealRepository {
  final Dio _dio = Dio();

  Future<MealModel> getMeal() async {
    String url = "https://www.themealdb.com/api/json/v1/1/random.php";

    try {
      Response response = await _dio.get(url);
      return MealModel.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      throw Exception('Error');
    }
  }
}
