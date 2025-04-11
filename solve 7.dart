import 'package:flutter/material.dart';

void main() => runApp(GridApp());

class GridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Image Grid')),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(10, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/200?random=$index'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
