import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom AppBar',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/appbar_lpgo.jpg'),
        ),
        title: const Text(
          'My App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              debugPrint('Search pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              debugPrint('Menu pressed');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('This is a custom AppBar!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
