import 'package:comida_appflutter/models/meal_model.dart';
import 'package:comida_appflutter/repository/meal_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealProvider = FutureProvider<MealModel>((ref) {
  print("Llamado...");
  final mealRepository = ref.watch(mealRepositoryProvider);
  return mealRepository.getMeal();
});

// Defino el proveedor del repositorio
final mealRepositoryProvider = Provider<MealRepository>((ref) {
  return MealRepository();
});
