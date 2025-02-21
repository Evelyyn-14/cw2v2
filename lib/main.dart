import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      'Fresas con Crema',
      '1 cup of Strawberries, 1 stick of cream cheese, 1 can of Evaporated milk, 1 can of condensed milk, 1 cup of sour cream and 1 teaspoon of vanilla extract',
      '1. Blend the cream cheese, evaporated milk, condensed milk, sour cream and vanilla extract. 2. Cut the strawberries into small pieces. 3. Mix the strawberries with the cream. 4. Serve cold.',
    ),
    Recipe(
      'Pasta Alfredo',
      '1 cup of pasta, 1 cup of heavy cream, 1 cup of parmesan cheese, 1 stick of butter, 1 teaspoon of garlic powder, 1 teaspoon of salt and 1 teaspoon of pepper',
      '1. Boil the pasta. 2. In a saucepan, melt the butter and add the heavy cream. 3. Add the parmesan cheese, garlic powder, salt and pepper. 4. Mix the pasta with the sauce. 5. Serve hot.',
    ),
    Recipe(
      'Guacamole',
      'Avocados, onion, tomato, cilantro, limes, 1 teaspoon of pepper, and 1 teaspoon of salt',
      '1. Cut the avocados into small pieces. 2. Mix the avocados with the onion, tomato, cilantro, lime juice, salt and pepper. 3. Serve cold.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen(recipe: recipes[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  DetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(recipe.ingredients, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Steps:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(recipe.steps, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class Recipe {
  final String name;
  final String ingredients;
  final String steps;

  Recipe(this.name, this.ingredients, this.steps);
}
