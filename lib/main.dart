import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: Text('Example'),),
      body: Center(child: Text('Hello Flutter!'),),
      bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Phone'), BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'), BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: 'Context')]), 
      ),
      );
    
  }
}
