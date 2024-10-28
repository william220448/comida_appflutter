import 'package:comida_appflutter/models/meal_model.dart';
import 'package:comida_appflutter/providers/meal_provider.dart';
import 'package:comida_appflutter/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(
      BuildContext context, T Function<T>(ProviderBase<Object, T>) watch) {
    AsyncValue<MealModel> meal = watch(mealProvider);

    return Scaffold(
      body: meal.when(
          loading: () => Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(
                child: Text(err.toString()),
              ),
          data: (recipe) {
            recipe.ingredients.removeWhere(
                (element) => element.name == null || element.name == '');
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            recipe.image,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  //Contenedor para mostrar más datos de la receta
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.name,
                            style: textStyle(35, Colors.black, FontWeight.w700),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Chip(
                                backgroundColor: Colors.yellowAccent,
                                label: Container(
                                  height: 25,
                                  child: Center(
                                    child: Text(
                                      recipe.category,
                                      style: textStyle(
                                          18, Colors.black, FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                              //Para tener espacio entre los chips
                              SizedBox(width: 10),
                              Chip(
                                backgroundColor: Colors.deepOrangeAccent,
                                label: Container(
                                  height: 25,
                                  child: Center(
                                    child: Text(
                                      recipe.area,
                                      style: textStyle(
                                          18, Colors.black, FontWeight.w700),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Ingredientes:",
                            style: textStyle(25, Colors.black, FontWeight.w800),
                          ),
                          //Para tener espacio
                          SizedBox(
                            height: 15,
                          ),
                          //Listado horizontal de ingredientes
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: recipe.ingredients.map((ingredient) {
                              return Column(
                                //Acá tiene que ir la imagen y el texto
                                children: [
                                  Image(
                                    width: 100,
                                    height: 100,
                                    image: NetworkImage(
                                        'https://www.themealdb.com/images/ingredients/${ingredient.name}.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    ingredient.name,
                                    style: textStyle(
                                        20, Colors.black, FontWeight.w800),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    ingredient.measure,
                                    style: textStyle(
                                        16, Colors.grey, FontWeight.w800),
                                  ),
                                ],
                              );
                            }).toList()),
                          ),
                          //Espacio
                          SizedBox(height: 10),
                          Text(
                            "Instrucciones",
                            style: textStyle(25, Colors.black, FontWeight.w800),
                          ),
                          //Para tener espacio
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            recipe.instructions,
                            style: textStyle(18, Colors.black, FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
