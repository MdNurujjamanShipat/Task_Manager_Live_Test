
import 'package:flutter/material.dart';
import 'dart:convert';
import 'models/recipe.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes',
      theme: ThemeData(
        primaryColor: Color(0xFF4A6572),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF4A6572),
          primary: Color(0xFF4A6572),
          secondary: Color(0xFFF9AA33),
        ),
        scaffoldBackgroundColor: Color(0xFFF5F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4A6572),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF4A6572),
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const RecipeApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  final String jsonData = '''
  {
    "recipes": [
      {
        "title": "Pasta Carbonara",
        "description": "Creamy pasta dish with bacon and cheese.",
        "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
      },
      {
        "title": "Caprese Salad",
        "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
        "ingredients": ["tomatoes", "mozzarella", "basil"]
      },
      {
        "title": "Banana Smoothie",
        "description": "Healthy and creamy smoothie with bananas and milk.",
        "ingredients": ["bananas", "milk"]
      },
      {
        "title": "Chicken Stir-Fry",
        "description": "Quick and flavorful stir-fried chicken with vegetables.",
        "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
      },
      {
        "title": "Grilled Salmon",
        "description": "Delicious grilled salmon with lemon and herbs.",
        "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
      },
      {
        "title": "Vegetable Curry",
        "description": "Spicy and aromatic vegetable curry.",
        "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
      },
      {
        "title": "Berry Parfait",
        "description": "Layered dessert with fresh berries and yogurt.",
        "ingredients": ["berries", "yogurt", "granola"]
      }
    ]
  }
  ''';

  @override
  Widget build(BuildContext context) {
    try {
      final Map<String, dynamic> jsonMap = json.decode(jsonData);
      final recipeResponse = RecipeResponse.fromJson(jsonMap);
      final recipes = recipeResponse.recipes;

      return HomeScreen(recipes: recipes);
    } catch (e) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, color: Colors.red, size: 64),
              SizedBox(height: 16),
              Text(
                'Error loading recipes',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ],
          ),
        ),
      );
    }
  }
}




