import 'package:flutter/material.dart';

class HomeSideBar extends StatelessWidget {
  const HomeSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(70),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(leading: Icon(Icons.favorite), title: Text('Favorites'), onTap: () => null),

          ListTile(leading: Icon(Icons.favorite), title: Text('Favorites'), onTap: () => null),
          ListTile(leading: Icon(Icons.person), title: Text('Friends'), onTap: () => null),
          ListTile(leading: Icon(Icons.share), title: Text('Share'), onTap: () => null),
          ListTile(leading: Icon(Icons.notifications), title: Text('Request')),
        ],
      ),
    );
  }
}
