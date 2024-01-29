import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;
  const TodayRecipeListView({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 400,
            // TODO: Add ListView Here
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return buildCard(recipe);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                itemCount: recipes.length),
          )
        ],
      ),
    );
  }

  // Gets recipe card based on type
  Widget buildCard(ExploreRecipe recipe) {
    switch (recipe.cardType) {
      case RecipeCardType.card1:
        return Card1(recipe: recipe);
      case RecipeCardType.card2:
        return Card2(recipe: recipe);
      case RecipeCardType.card3:
        return Card3(recipe: recipe);
      default:
        throw Exception("This card doesn't exist");
    }
  }
}
