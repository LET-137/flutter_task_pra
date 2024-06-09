import 'package:flutter/material.dart';
import 'package:taskcellpra/Views/home_view.dart';

// import 'Views/views.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task List'),
        ),
        body: const HomeView(),  
      ),
    );
  }
}
