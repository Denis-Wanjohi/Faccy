import 'package:example_5/pages/new_recipe_page.dart';
import 'package:example_5/pages/recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GenericRecipePage extends StatefulWidget {
  const GenericRecipePage({super.key});

  @override
  State<GenericRecipePage> createState() => _GenericRecipePageState();
}

class _GenericRecipePageState extends State<GenericRecipePage> {
  var box = Hive.box("recipes_box");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewRecipePage()));
          },
          child: Icon(Icons.bookmark_add_sharp),
        ),
        body: ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipePage(
                                name: box.get(index + 1)['name'],
                                image: box.get(index + 1)['image'],
                                tags: box.get(index + 1)['tags'],
                                ratings: 0.0,
                                reviews: 0.0,
                                serving: int.parse( box.get(index + 1)['servings']),
                                ingredients: box.get(index + 1)['ingredients'],
                                prepTime: int.parse(box.get(index + 1)['prepTimeMinutes']),
                                cookTime: int.parse(box.get(index + 1)['cookTimeMinutes']),
                                instructions: box.get(index + 1)['instructions'],
                                mealType: box.get(index + 1)['mealType'],
                              )));
                },
                leading: Image.network('${box.get(index + 1)['image']}'),
                title: Text(
                  "${box.get(index + 1)['name']}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...box.get(index + 1)['tags'].map<Widget>((tag) {
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
                            Text("0.0")
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
                            Text("${00}")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
