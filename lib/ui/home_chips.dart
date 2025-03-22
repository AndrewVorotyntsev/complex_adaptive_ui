import 'package:flutter/material.dart';

class HomeChips extends StatelessWidget {
  const HomeChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        children: [
          SizedBox(width: 30),

          Chip(label: Row(children: [Icon(Icons.home, color: Colors.purple), SizedBox(width: 4), Text('Home')])),
          SizedBox(width: 10),
          Chip(
            label: Row(children: [Icon(Icons.favorite, color: Colors.purple), SizedBox(width: 4), Text('Favorites')]),
          ),
          SizedBox(width: 10),

          Chip(
            label: Row(children: [Icon(Icons.bookmark, color: Colors.purple), SizedBox(width: 4), Text('Bookmarks')]),
          ),
        ],
      ),
    );
  }
}
