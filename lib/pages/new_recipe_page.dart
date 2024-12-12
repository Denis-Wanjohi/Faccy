import 'package:example_5/components/my_textField.dart';
import 'package:example_5/components/recipe.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class NewRecipePage extends StatefulWidget {
  const NewRecipePage({super.key});

  @override
  State<NewRecipePage> createState() => _NewRecipePageState();
}

class _NewRecipePageState extends State<NewRecipePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _prepTimeController = TextEditingController();
  TextEditingController _cookiTimeController = TextEditingController();
  TextEditingController _mealTypeController = TextEditingController();
  TextEditingController _tagsController = TextEditingController();
  TextEditingController _ingredientsController = TextEditingController();
  TextEditingController _instructionsController = TextEditingController();
  TextEditingController _instructionsEditController = TextEditingController();
  TextEditingController _platesConntroller = TextEditingController();

  List<String> mealType = [];
  List<String> tags = [];
  List<String> ingredients = [];
  List<String> steps = [];
  late String imagePath = '';
  bool isEditing = false;
  int? editIndex = null;

  void recipeAdd() {
    var box = Hive.box("recipes_box");

    box.put(box.length + 1, {
      'name': _nameController.text,
      'image': imagePath,
      'tags': tags,
      'servings': _platesConntroller.text,
      'ingredients': ingredients,
      'prepTimeMinutes': _prepTimeController.text,
      'cookTimeMinutes': _cookiTimeController.text,
      'instructions': steps,
      'mealType': mealType,
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'New Recipe',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Text(
                'Lets get spicy,what the new recipe?',
                style: TextStyle(),
              )),
              MyTextfield(
                label: "Recipe Name",
                controller: _nameController,
                type: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imagePath != ''
                          ? Expanded(
                              child: Image.network(
                                '${imagePath}',
                                fit: BoxFit.fill,
                              ),
                            )
                          : Center(
                              child: MaterialButton(
                                onPressed: () async {
                                  try {
                                    final XFile? image = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
      
                                    // ATTENTION - THIS CODE WILL BE ON FOR ANDROID / EMULATOTS/ IOS
                                    // final Directory appDir = await getApplicationDocumentsDirectory();
                                    // final String newFilePath = '${appDir.path}/${image!.name}';
                                    // final File imageFile = File(image.path);
                                    // await imageFile.copy(newFilePath);
                                    // print("Image saved to: $newFilePath");
                                    setState(() {
                                      imagePath = image!.path;
                                    });
                                  } on Exception catch (e) {
                                    // TODO
                                    print(e);
                                  }
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.add_a_photo),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Upload image")
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              MyTextfield(
                label: "Prepartion Time in minutes eg 20 ",
                controller: _prepTimeController,
                type: TextInputType.number,
              ),
              MyTextfield(
                label: "Cooking Time in minutes eg 20",
                controller: _cookiTimeController,
                type: TextInputType.number,
              ),
      
              //MEAL TYPE
              mealType.length > 0
                  ? Container(
                      constraints: BoxConstraints(maxHeight: 30),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: mealType.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _mealTypeController.text = mealType[index];
                                      mealType.removeAt(index);
                                    });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade400,
                                          borderRadius: BorderRadius.circular(2)),
                                      child: Text(
                                        "${mealType[index]}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
      
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextfield(
                        label: "Meal Type",
                        controller: _mealTypeController,
                        type: TextInputType.text,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            mealType.add(_mealTypeController.text);
                            _mealTypeController.text = '';
                          });
                        },
                        child: Icon(
                          Icons.add_box_rounded,
                          color: Colors.blue,
                          size: 40,
                        ))
                  ],
                ),
              ),
      
              // TAGS
              tags.length > 0
                  ? Container(
                      height: 30,
                      constraints: BoxConstraints(maxHeight: 50),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: tags.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _tagsController.text = tags[index];
                                      tags.removeAt(index);
                                    });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.green.shade200,
                                          borderRadius: BorderRadius.circular(4)),
                                      child: Text(
                                        "${tags[index]}",
                                        style: TextStyle(fontSize: 10),
                                      )),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
      
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextfield(
                        label: "Tag",
                        controller: _tagsController,
                        type: TextInputType.text,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            tags.add(_tagsController.text);
                            _tagsController.text = '';
                          });
                        },
                        child: Icon(
                          Icons.add_box_rounded,
                          color: Colors.blue,
                          size: 40,
                        ))
                  ],
                ),
              ),
      
              // INGREDIENTS
              Text('Ingredients'),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("- ${ingredients[index]}"),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _ingredientsController.text =
                                      ingredients[index];
                                  ingredients.removeAt(index);
                                });
                              },
                              child: Icon(Icons.edit, color: Colors.green))
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextfield(
                        label: "Ingredient...",
                        controller: _ingredientsController,
                        type: TextInputType.text,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            ingredients.add(_ingredientsController.text);
                            _ingredientsController.text = '';
                          });
                        },
                        child: Icon(
                          Icons.add_box_rounded,
                          color: Colors.blue,
                          size: 40,
                        ))
                  ],
                ),
              ),
      
              // INSTRUCTIONS
              Text('Instructions:'),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: steps.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10),
                      child: isEditing
                          ? editIndex == index
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: MyTextfield(
                                          label: "step ${index + 1}...",
                                          controller: _instructionsEditController,
                                          type: TextInputType.text,
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              steps[index] =
                                                  _instructionsEditController
                                                      .text;
                                              // steps.add(_instructionsController.text);
                                              _instructionsEditController.text =
                                                  '';
                                              isEditing = false;
                                            });
                                          },
                                          child: Icon(
                                            Icons.add_box_rounded,
                                            color: Colors.green,
                                            size: 40,
                                          ))
                                    ],
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Step ${index + 1}. ${steps[index]}"),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            editIndex = index;
                                            isEditing = !isEditing;
                                          });
                                        },
                                        child:
                                            Icon(Icons.edit, color: Colors.green))
                                  ],
                                )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Step ${index + 1}. ${steps[index]}"),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _instructionsEditController.text =
                                            steps[index];
                                        editIndex = index;
                                        isEditing = !isEditing;
                                      });
                                    },
                                    child: Icon(Icons.edit, color: Colors.green))
                              ],
                            ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextfield(
                        label: "step ${steps.length + 1}...",
                        controller: _instructionsController,
                        type: TextInputType.text,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            steps.add(_instructionsController.text);
                            _instructionsController.text = '';
                          });
                        },
                        child: Icon(
                          Icons.add_box_rounded,
                          color: Colors.blue,
                          size: 40,
                        ))
                  ],
                ),
              ),
      
              // SERVINGS
              MyTextfield(
                label: "How many plates? eg 4",
                controller: _platesConntroller,
                type: TextInputType.number,
              ),
      
              GestureDetector(
                onTap: recipeAdd,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      height: 50,
                      child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Icon(Icons.add),
                            Text('S A V E',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold))
                          ]))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
