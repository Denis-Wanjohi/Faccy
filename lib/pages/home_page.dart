import 'package:example_5/components/recipe.dart';
import 'package:example_5/components/tab.dart';
import 'package:example_5/pages/generic_recipe_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin  {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with vsync
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Dispose the TabController when the widget is removed from the widget tree
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Not sure what to cook today?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("How About a pizaa?",style: TextStyle(
                      fontSize: 20
                    ),),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.network(
                        'data:image/jpeg;base64,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',
                        width: 100,
                        height: 100, 
                      ),
                    )
                  ],
                ),
                Text("Preparation: 30 min"),
                Text("Cooking: 45 min"),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: MaterialButton(onPressed: () {
                    print("object");
                  },
                  child: Text("Get started",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  ),
                ),
      
               
                
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: [
            Tab(text:'Recipe',icon:Icon(Icons.bookmark_added)),
            Tab(text:'Added',icon:Icon(Icons.bookmark_add_sharp)),
            
          ]),
      
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
              Recipe(),
              GenericRecipePage(),
            ]),
          )
        ],
      ),
    );
  }
}
