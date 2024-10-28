import 'package:comida_appflutter/screens/recipe_screen.dart';
import 'package:comida_appflutter/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/fondo.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.80)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿Tienes hambre?",
                  style: textStyle(30, Colors.black, FontWeight.w700),
                ),

                //Para separar el texto del botón
                const SizedBox(
                  height: 25,
                ),

                //Botón para pasar a mostrar la receta
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProviderScope(
                        child: RecipeScreen(),
                      ),
                    ),
                  ),
                  child: Text(
                    "Mostrar receta",
                    style: textStyle(22, Colors.black, FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
