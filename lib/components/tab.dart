import 'package:flutter/material.dart';

class Tabss extends StatefulWidget {
  const Tabss({super.key});

  @override
  State<Tabss> createState() => _TabssState();
}

class _TabssState extends State<Tabss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container to hold the TabBar
          Container(
            color: Colors.grey[200],
            child: TabBar(
              tabs: [
                Tab(text: "Recipes", icon: Icon(Icons.bookmark_added_rounded)),
                Tab(text: "Own Made", icon: Icon(Icons.bookmark_added_rounded)),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}