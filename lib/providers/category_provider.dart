import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comida_appflutter/models/category_model.dart';
import 'package:comida_appflutter/repository/category_repository.dart';

final categoryProvider = FutureProvider<List<CategoryModel>>((ref) {
  return CategoryRepository().getCategories();
});
