import 'package:escape_parent_padding/escapable_padding.dart';
import 'package:escape_parent_padding/escaped.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Escape Parent Padding',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EscapeScreen(),
    );
  }
}

class EscapeScreen extends StatelessWidget {
  const EscapeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escape Parent Padding')),
      body: SingleChildScrollView(
        child: EscapablePadding(
          padding: const EdgeInsets.all(20),
          builder: (context, children) => Column(children: [...children]),
          children: [
            Container(
              height: 200,
              color: Colors.green,
              child: const Center(child: Text('Container')),
            ),
            Escaped(
              child: Container(
                height: 200,
                color: Colors.yellow,
                child: const Center(child: Text('Escaped Container')),
              ),
            ),
            Container(
              height: 200,
              color: Colors.green,
              child: const Center(child: Text('Container')),
            ),
            Escaped(
              child: Container(
                height: 200,
                color: Colors.yellow,
                child: const Center(child: Text('Escaped Container')),
              ),
            ),
            Container(
              height: 200,
              color: Colors.green,
              child: const Center(child: Text('Container')),
            ),
            Escaped(
              child: Container(
                height: 200,
                color: Colors.yellow,
                child: const Center(child: Text('Escaped Container')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
