import 'package:example_5/model/Recipe_model.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
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
  List<String> mealType;

  RecipePage({
    super.key,
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
    required this.mealType,
  });

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  List dummy = ['one', 'two', 'three'];

  @override
  Widget build(BuildContext context) {
    print(widget.tags.length);
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        backgroundColor: Colors.blue,
        pinned: true,
        floating: true,
        expandedHeight: 250,
        flexibleSpace: FlexibleSpaceBar(
            title: Text("${widget.name}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: 
            Colors.white,backgroundColor: Colors.blue.shade800),),
            background: Image.network(
              '${widget.image}',
              fit: BoxFit.cover,
            )),
      ),
      
      SliverCrossAxisGroup(slivers: [
      SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.mealType.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "${widget.mealType[index]}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
        SliverToBoxAdapter(
          child:Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                  ),
                  Text('${widget.ratings}')
                ],
              ),
            )
        ),
      ]),

      // tags
      SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.tags.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "${widget.tags[index]}",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),


      
      // times
      SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text("Prep Time: "),
                Text(
                  "${widget.prepTime} min",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text("Cooking Time: "),
                Text(
                  "${widget.cookTime} min",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),

      // INSTRUCTIONS
      SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  "Ingridients",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.instructions.length,
                    itemBuilder: (context, index) {
                      return Text("- ${widget.instructions[index]}");
                    })
              ],
            ),
          ),
        ),
      ),

      // INSTRUCTIONS
      SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  "Instructions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.ingredients.length,
                    itemBuilder: (context, index) {
                      return Text("${index + 1}. ${widget.ingredients[index]}");
                    })
              ],
            ),
          ),
        ),
      ),

      //servings and review count
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(bottom: 40.0, top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Serving: ${widget.serving}', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Total reviews: ${widget.reviews}', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    ]));
  }
}
