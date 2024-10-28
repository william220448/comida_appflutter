class MealModel {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String image;
  final List<Ingredient> ingredients;

  MealModel(this.id, this.name, this.category, this.area, this.instructions,
      this.image, this.ingredients);

  MealModel.fromJson(Map<String, dynamic> json)
      : id = json['meals'][0]['idMeal'],
        name = json['meals'][0]['strMeal'],
        category = json['meals'][0]['strCategory'],
        area = json['meals'][0]['strArea'],
        instructions = json['meals'][0]['strInstructions'],
        image = json['meals'][0]['strMealThumb'],
        ingredients = List.generate(
            20,
            (index) => Ingredient(json['meals'][0]['strIngredient${index + 1}'],
                json['meals'][0]['strMeasure${index + 1}']));
}

class Ingredient {
  final String name;
  final String measure;
  Ingredient(this.name, this.measure);
}
