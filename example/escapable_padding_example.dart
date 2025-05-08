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
      body: EscapablePadding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        builder: (context, children) => ListView(children: [...children]),
        children: [
          Container(
            height: 200,
            color: Colors.pinkAccent,
            child: const Center(child: Text('Container')),
          ),
          Escaped(
            child: SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                itemBuilder:
                    (context, index) => Container(
                      height: 200,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 32,
                      ),
                      color: Colors.indigo,
                      child: Center(
                        child: Text('Escaped ListView Item $index'),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
              ),
            ),
          ),
          Container(
            height: 200,
            color: Colors.pinkAccent,
            child: const Center(child: Text('Container')),
          ),
          Escaped(
            child: Container(
              height: 200,
              color: Colors.indigo,
              child: const Center(child: Text('Escaped Container')),
            ),
          ),
        ],
      ),
    );
  }
}
