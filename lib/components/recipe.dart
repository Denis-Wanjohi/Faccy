import 'dart:convert';

import 'package:example_5/model/Recipe_model.dart';
import 'package:example_5/pages/home_page.dart';
import 'package:example_5/pages/recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  late List<Recipe_model> recipes = [];
  Future<List<Recipe_model>> fetchPosts() async {
    final url = Uri.parse('https://dummyjson.com/recipes?limit=10');
    final response = await http.get(url);
    // print(jsonDecode(response.body)['recipes']);

    if (response.statusCode == 200) {
      for (var post in jsonDecode(response.body)['recipes']) {
        recipes.add(Recipe_model.fromJson(post));
      }
      return recipes;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe_model>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          // else if (snapshot.hasData) {
          late final post = snapshot.data;
          return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipePage(
                                name: recipes[index].name,
                                image: recipes[index].image,
                                tags: recipes[index].tags,
                                ratings: recipes[index].ratings,
                                reviews: recipes[index].reviews,
                                serving: recipes[index].serving,
                                ingredients: recipes[index].ingredients,
                                prepTime: recipes[index].prepTime,
                                cookTime: recipes[index].cookTime,
                                instructions: recipes[index].instructions,
                                mealType: recipes[index].mealType,)));
                  },
                  leading: Image.network('${recipes[index].image}'),
                  title: Text(
                    "${recipes[index].name}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...recipes[index].tags.map<Widget>((tag) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.blue.shade100,
                              ),
                              child: Text(
                                '${tag}',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${recipes[index].ratings}")
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.menu_book_rounded,
                                color: Colors.blue,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${recipes[index].reviews}")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
          // }

          // return Text("hah");
        });
  }
}
