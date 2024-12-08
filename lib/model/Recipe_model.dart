class Recipe_model {
  String name;
  String image;
  List<String> tags; 
  double ratings;
  double reviews;
  int serving;
  List<String> ingredients; 
  int prepTime; 
  int cookTime; 
  List<String> instructions;

  Recipe_model({
    required this.name,
    required this.image,
    required this.tags,
    required this.ratings,
    required this.reviews,
    required this.serving,
    required this.ingredients,
    required this.prepTime,
    required this.cookTime,
    required this.instructions,
  });

    factory Recipe_model.fromJson(Map<String, dynamic> json) {
    return Recipe_model(
      name: json['name'],
      image: json['image'],
      tags: List<String>.from(json['tags'] ?? []), // Ensure correct type
      ratings: json['rating'].toDouble(),
      reviews: json['reviewCount'],
      serving: json['servings'],
      ingredients: List<String>.from(json['ingredients'] ?? []), // Ensure correct type
      prepTime: json['prepTimeMinutes'],
      cookTime: json['cookTimeMinutes'],
      instructions: List<String>.from(json['instructions'] ?? []), // Ensure correct type
    );
  }



  
}
