
import 'package:flutter/material.dart';
import '../models/recipe.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes;

   HomeScreen({super.key, required this.recipes});

  // Color palette for different recipe cards
  final List<Color> cardColors = [
    Color(0xFFE3F2FD), // Light Blue
    Color(0xFFF3E5F5), // Light Purple
    Color(0xFFE8F5E8), // Light Green
    Color(0xFFFFF3E0), // Light Orange
    Color(0xFFFCE4EC), // Light Pink
    Color(0xFFE8EAF6), // Light Indigo
    Color(0xFFF1F8E9), // Light Lime
  ];

  final List<Color> accentColors = [
    Color(0xFF1976D2), // Blue
    Color(0xFF7B1FA2), // Purple
    Color(0xFF388E3C), // Green
    Color(0xFFF57C00), // Orange
    Color(0xFFC2185B), // Pink
    Color(0xFF303F9F), // Indigo
    Color(0xFF7CB342), // Lime Green
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          '🍽️ Food Recipes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4A6572),
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF5F7FA),
              Color(0xFFE4E7EB),
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            final cardColor = cardColors[index % cardColors.length];
            final accentColor = accentColors[index % accentColors.length];

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: accentColor.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Recipe header with colored bullet and title
                        Row(
                          children: [
                            // Colored bullet point
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: accentColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Recipe title
                            Expanded(
                              child: Text(
                                recipe.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: accentColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Description with icon
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.description,
                              color: accentColor,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                recipe.description,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Ingredients count
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: accentColor.withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.shopping_basket,
                                color: accentColor,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${recipe.ingredients.length} ingredients',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: accentColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF4A6572),
        child: const Icon(Icons.restaurant_menu, color: Colors.white),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import '../models/recipe.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes;

  const HomeScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Recipes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bullet point and title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bullet point
                      const Padding(
                        padding: EdgeInsets.only(top: 2, right: 10),
                        child: Text(
                          '•',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Title (bold)
                      Expanded(
                        child: Text(
                          recipe.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Description (indented under title)
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 4),
                    child: Text(
                      recipe.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                  ),
                  // Divider (except for last item)
                  if (index < recipes.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 20),
                      child: Divider(
                        color: Colors.grey.shade300,
                        height: 1,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

 */




